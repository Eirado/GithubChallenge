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
//    private let fetchUserProfileUseCase: FetchUserProfileUseCase
//    
//    init(fetchUserProfileUseCase: FetchUserProfileUseCase) {
//        self.fetchUserProfileUseCase = fetchUserProfileUseCase
//    }
    
    func searchUser() {
        // Call use case here
    }
}
