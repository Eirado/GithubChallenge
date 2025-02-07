//
//  HomeViewModel.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//

import Foundation

enum UserError: Error {
    case UserNotFound
}

class HomeViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var avatarURL: String = ""
    @Published var gitHubRepos: [GitHubRepo] = []
    @Published var isLoading = false
   
    private let fetchReposUseCase: FetchReposUseCaseProtocol
    private let errorHandler: ErrorHandlerProtocol
    
    init(fetchReposUseCase: FetchReposUseCaseProtocol, errorHandler: ErrorHandlerProtocol) {
        self.fetchReposUseCase = fetchReposUseCase
        self.errorHandler = errorHandler
    }
    
    func fetchRepos(){
        isLoading = true
        Task { @MainActor in
            do {
                self.gitHubRepos = try await fetchReposUseCase.executeRepository(userName: userName)
                try retriveUserProfile()
            } catch {
                let errorMessage = errorHandler.handle(error: error)
                print(errorMessage)
            }
            isLoading = false
        }
    }
    private func retriveUserProfile() throws {
        guard let firstRepoOwner = gitHubRepos.first?.owner else {
            throw UserError.UserNotFound
        }
        self.userName = firstRepoOwner.login
        self.avatarURL = firstRepoOwner.avatarURL
    }
}
