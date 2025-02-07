//
//  Home.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @State private var isNavigating = false
    
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                    .background(.ultraThinMaterial)
                Spacer()
                
                TextField("Username", text: $viewModel.userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                NavigationLink(destination: GitHubDetailsView(viewModel: GitHubDetailsViewModelFactory.makeHomeViewModel(), avatarURL: viewModel.avatarURL, userName: viewModel.userName, gitHubRepos: viewModel.gitHubRepos),
                               isActive: $viewModel.isFetchFinished
                ) {
                    EmptyView()
                }
                if viewModel.isLoading{
                    ProgressView()
                } else {
                    Button("Search") {
                        viewModel.fetchRepos()
                    }
                    .disabled(viewModel.userName.isEmpty)
                }
                Spacer()
            }
            .navigationTitle("GitHub Viewer")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .alert(isPresented: $viewModel.isAlertShowing) {
                Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModelFactory.makeHomeViewModel())
}
