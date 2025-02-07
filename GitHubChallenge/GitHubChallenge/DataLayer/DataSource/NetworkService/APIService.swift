//
//  APIService.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

import Foundation

public protocol NetworkSession {
    func customDataTaskPublisher(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: NetworkSession {
    public func customDataTaskPublisher(for request: URLRequest) async throws -> (Data, URLResponse) {
        let (data, response) = try await self.data(for: request)
        return (data, response)
    }
}

public protocol APIServiceProtocol {
    func request<T: Decodable>(_ target: APITarget) async throws -> T
}

class APIService: APIServiceProtocol {
    private let session: NetworkSession

    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }
    
    public func request<T: Decodable>(_ target: APITarget) async throws -> T {
        var request = URLRequest(url: target.url)
        request.httpMethod = target.method
        request.allHTTPHeaderFields = target.headers
        
        if target.method == "POST" {
            request.httpBody = try? JSONSerialization.data(withJSONObject: target.task, options: .prettyPrinted)
        }
        
        let (data, response) = try await session.customDataTaskPublisher(for: request)
  
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.unknown
        }
        print(httpResponse)
        switch httpResponse.statusCode {
        case 200..<300:
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            print(decodedData)
            return decodedData
            
        case 400:
            throw APIError.badRequest
        case 401:
            throw APIError.unauthorized
        case 403:
            throw APIError.forbidden
        case 404:
            throw APIError.notFound
        case 500:
            throw APIError.serverError
        default:
            throw APIError.unknown
        }
    }
}
