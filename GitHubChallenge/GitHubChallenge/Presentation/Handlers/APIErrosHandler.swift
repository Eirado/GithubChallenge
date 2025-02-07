//
//  APIErrosHandler.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

public protocol ErrorHandlerProtocol {
    func handle(error: Error) -> String
}

class APIErrorHandler: ErrorHandlerProtocol {
    func handle(error: Error) -> String {
        if let apiError = error as? APIError {
            switch apiError {
            case .notFound:
                return "User not found. Please check the username."
            case .badRequest:
                return "Invalid request. Please try again."
            case .unauthorized:
                return "Unauthorized. Please check your credentials."
            case .forbidden:
                return "Access denied. You don't have permission."
            case .serverError:
                return "Server error. Please try again later."
            case .unknown:
                return "An unknown error occurred."
            }
        }
        return "An unexpected error occurred."
    }
}
