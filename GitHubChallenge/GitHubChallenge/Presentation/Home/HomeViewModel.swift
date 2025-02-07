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
    
    init(fetchReposUseCase: FetchReposUseCaseProtocol) {
        self.fetchReposUseCase = fetchReposUseCase
    }
    
    func fetchRepos(){
        isLoading = true
        Task { @MainActor in
            do {
                self.gitHubRepos = try await fetchReposUseCase.executeRepository(userName: "Eirado")
                try retriveUserProfile()
            } catch {
                
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
