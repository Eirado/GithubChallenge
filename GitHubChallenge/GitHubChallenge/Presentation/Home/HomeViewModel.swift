//
//  HomeViewModel.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var GitHubRepos: [GitHubRepo] = []
    @Published var error: APIError?
    
    private let fetchReposUseCase: FetchReposUseCaseProtocol
    
    init(fetchReposUseCase: FetchReposUseCaseProtocol) {
        self.fetchReposUseCase = fetchReposUseCase
    }
    
    func fetch(){
        Task { @MainActor in
            do {
                self.GitHubRepos = try await fetchReposUseCase.executeRepository(userName: "Eirado")
            } catch {
                
            }
        }
       
    }
}
