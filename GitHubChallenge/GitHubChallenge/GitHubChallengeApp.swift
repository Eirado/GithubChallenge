//
//  GitHubChallengeApp.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//

import SwiftUI

@main
struct GitHubChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModelFactory.makeHomeViewModel())
        }
    }
}
