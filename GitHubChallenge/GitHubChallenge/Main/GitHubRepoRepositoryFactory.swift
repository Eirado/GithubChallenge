//
//  Untitled.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

public struct GitHubRepoRepositoryFactory {
    public static func makePokemonRepository(apiService: APIServiceProtocol = APIServiceFactory.makeAPIService()) -> GitHubRepoRepositoryProtocol {
        return GitHubRepoRepository(apiService: apiService)
    }
}

