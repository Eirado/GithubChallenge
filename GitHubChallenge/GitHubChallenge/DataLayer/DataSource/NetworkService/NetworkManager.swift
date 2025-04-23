//
//  APIService.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.

import Foundation

public protocol NetworkSessionProtocol {
    func performRequest(with requestURL: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: NetworkSessionProtocol {
    public func performRequest(with requestURL: URLRequest) async throws -> (Data, URLResponse) {
        let (data, response) = try await self.data(for: requestURL)
        return (data, response)
    }
}

public protocol NetworkManagerProtocol {
    func request<T: Decodable>(_ target: APITarget) async throws -> T
}

final class NetworkManager: NetworkManagerProtocol {
    
    private let session: NetworkSessionProtocol
    
    init(session: NetworkSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    public func request<T: Decodable>(_ target: APITarget) async throws -> T {
        
        var requestURL = URLRequest(url: target.url)
        requestURL.httpMethod = target.method
        requestURL.allHTTPHeaderFields = target.headers
        
        if target.method == "POST" {
            do {
                requestURL.httpBody = try JSONSerialization.data(
                    withJSONObject: target.parameters,
                    options: .prettyPrinted)
            } catch {
                throw NetworkError.invalidParameters
            }
        }
        
        let (data, response) = try await session.performRequest(with: requestURL)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknown
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        case 400:
            throw NetworkError.badRequest
        case 401:
            throw NetworkError.unauthorized
        case 403:
            throw NetworkError.forbidden
        case 404:
            throw NetworkError.notFound
        case 500:
            throw NetworkError.serverError
        default:
            throw NetworkError.unknown
        }
    }
}
