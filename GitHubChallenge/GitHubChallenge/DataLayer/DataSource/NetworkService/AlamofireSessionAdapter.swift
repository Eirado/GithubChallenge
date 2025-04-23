//
//  AlamofireSessionAdapter.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 23/04/25.
//

//import Alamofire
//import Foundation
//
//final class AlamofireSessionAdapter: NetworkSessionProtocol {
//    
//    func performRequest(with requestURL: URLRequest) async throws -> (Data, URLResponse) {
//        return try await withCheckedThrowingContinuation { continuation in
//            AF.request(requestURL).validate().responseData { response in
//                switch response.result {
//                case .success(let data):
//                    if let urlResponse = response.response {
//                        continuation.resume(returning: (data, urlResponse))
//                    } else {
//                        continuation.resume(throwing: NetworkError.unknown)
//                    }
//                case .failure:
//                    continuation.resume(throwing: NetworkError.unknown)
//                }
//            }
//        }
//    }
//}
