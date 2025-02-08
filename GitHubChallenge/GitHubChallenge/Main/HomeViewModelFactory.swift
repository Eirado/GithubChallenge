//
//  HomeViewModelFactory.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//

struct HomeViewModelFactory {
    static func makeHomeViewModel() -> HomeViewModel {
        let gitHubRepoRepository: GitHubRepoRepositoryProtocol = GitHubRepoRepositoryFactory.makeGitHubRepoRepository()
        let fetchReposUseCase: FetchReposUseCaseProtocol = FetchReposUseCaseFactory.makeFetchReposUseCase(gitHubRepository: gitHubRepoRepository)
        let apiErrorHandler: ErrorHandlerProtocol = APIErrorHandlerFactory.makeAPIErrorHandler()
        return HomeViewModel(fetchReposUseCase: fetchReposUseCase, errorHandler: apiErrorHandler)
    }
}
