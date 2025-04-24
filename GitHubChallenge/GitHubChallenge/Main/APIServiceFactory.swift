//
//  APIFactory.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

import Alamofire

public struct NetworkManagerFactory {
    public static func makeNetworkManager(with session: NetworkSessionProtocol) -> NetworkManagerProtocol {
        let manager = NetworkManager(session: session)
        return manager
    }
}
