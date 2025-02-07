//
//  FetchReposUseCase.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

public protocol FetchReposUseCaseProtocol {
    func executeRepository(userName: String) async throws -> [GitHubRepo]
}

class FetchReposUseCase: FetchReposUseCaseProtocol {
    private let gitHubRepository: GitHubRepoRepositoryProtocol
    
    init(gitHubRepository: GitHubRepoRepositoryProtocol) {
        self.gitHubRepository = gitHubRepository
    }
    
    func executeRepository(userName: String) async throws -> [GitHubRepo] {
        return try await gitHubRepository.fetch(userName: userName)
    }
}
