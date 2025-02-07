//
//  Untitled.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

public struct FetchReposUseCaseFactory {
    public static func makeFetchReposUseCase(gitHubRepository: GitHubRepoRepositoryProtocol) -> FetchReposUseCaseProtocol {
        return FetchReposUseCase(gitHubRepository: gitHubRepository)
    }
}
