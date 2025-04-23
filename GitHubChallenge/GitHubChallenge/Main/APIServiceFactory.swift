//
//  APIFactory.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

public struct APIServiceFactory {
    public static func makeAPIService() -> NetworkManagerProtocol {
        return NetworkManager()
    }
}
