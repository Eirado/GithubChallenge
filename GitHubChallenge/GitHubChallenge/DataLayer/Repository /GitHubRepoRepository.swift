//
//  GitHubRepoRepository.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

public protocol GitHubRepoRepositoryProtocol {
    func fetch(userName: String) async throws -> [GitHubRepo]
}

public struct GitHubRepoRepository: GitHubRepoRepositoryProtocol {
    
    private let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol = APIServiceFactory.makeAPIService()) {
        self.apiService = apiService
    }

    public func fetch(userName: String) async throws  -> [GitHubRepo] {
        let object: [GitHubRepo] =  try await apiService.request(.getGitHubRepos(userName: "Eirado"))
        return object
    }
}
