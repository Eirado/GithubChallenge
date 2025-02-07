//
//  APIError.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

import Foundation

public enum APIError: Error {
    case badRequest // 400
    case unauthorized // 401
    case forbidden // 403
    case notFound // 404
    case serverError // 500
    case unknown
}
