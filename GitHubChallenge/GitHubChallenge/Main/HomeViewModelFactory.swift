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
        let manager = NetworkManagerFactory.makeNetworkManager(with: Session.default)
        let gitHubRepoRepository: GitHubRepoRepositoryProtocol = GitHubRepoRepositoryFactory.makeGitHubRepoRepository(apiService: manager)
        let fetchReposUseCase: FetchReposUseCaseProtocol = FetchReposUseCaseFactory.makeFetchReposUseCase(gitHubRepository: gitHubRepoRepository)
        let apiErrorHandler: ErrorHandlerProtocol = APIErrorHandlerFactory.makeAPIErrorHandler()
        return HomeViewModel(fetchReposUseCase: fetchReposUseCase, errorHandler: apiErrorHandler)
    }
}
