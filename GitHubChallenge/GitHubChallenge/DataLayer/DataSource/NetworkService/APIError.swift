//
//  APIError.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

import Foundation

enum NetworkError: Error {
    case badRequest // 400
    case unauthorized // 401
    case forbidden // 403
    case notFound // 404
    case serverError // 500
    case unknown
    case noInternetConnection
    case anyUnintendedResponse
    case invalidParameters
}

// TODO add more LocalizedError 
extension NetworkError: LocalizedError {
    
    var errorTitle: String? {
        switch self {
        case .noInternetConnection:
            return "Sem Conexão com a Internet."
        default:
            return ""
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "Você não está conectado à internet. Verifique sua conexão e tente novamente."
        default:
            return ""
        }
    }
}
