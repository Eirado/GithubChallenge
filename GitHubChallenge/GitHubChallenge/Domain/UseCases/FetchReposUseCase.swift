//
//  FetchReposUseCase.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

public protocol FetchReposUseCaseProtocol {
    func executeRepository() async throws -> [GitHubRepository]
}

class FetchReposUseCase: FetchReposUseCaseProtocol {
  
    func fetch() async throws -> [GitHubRepository] {
        <#code#>
    }
}
