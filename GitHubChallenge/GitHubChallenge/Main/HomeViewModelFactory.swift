//
//  HomeViewModelFactory.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//
import Alamofire
import Foundation

struct HomeViewModelFactory {
    static func makeHomeViewModel() -> HomeViewModel {
//        let manager = NetworkManagerFactory.makeNetworkManager(with: URLSession.shared)
        let manager = NetworkManagerFactory.makeNetworkManager(with: Session.default)
        let gitHubRepoRepository: GitHubRepoRepositoryProtocol = GitHubRepoRepositoryFactory.makeGitHubRepoRepository(apiService: manager)
        let fetchReposUseCase: FetchReposUseCaseProtocol = FetchReposUseCaseFactory.makeFetchReposUseCase(gitHubRepository: gitHubRepoRepository)
        return HomeViewModel(fetchReposUseCase: fetchReposUseCase)
    }
}
