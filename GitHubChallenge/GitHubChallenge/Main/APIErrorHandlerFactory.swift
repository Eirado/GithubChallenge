//
//  APIErrorHandlerFactory.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

public struct APIErrorHandlerFactory {
    static public func makeAPIErrorHandler() -> ErrorHandlerProtocol {
        return APIErrorHandler()
    }
}
