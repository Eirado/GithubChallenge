//
//  HomeViewModelFactory.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//

struct HomeViewModelFactory {
    static func makeHomeViewModel() -> HomeViewModel {
        
        let gitHubRepoRepository: GitHubRepoRepositoryProtocol = GitHubRepoRepositoryFactory.makePokemonRepository()
        let fetchReposUseCase: FetchReposUseCaseProtocol = FetchReposUseCaseFactory.makeFetchReposUseCase(gitHubRepository: gitHubRepoRepository)
        
        return HomeViewModel(fetchReposUseCase: fetchReposUseCase)
    }
}
