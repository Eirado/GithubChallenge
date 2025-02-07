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
            NavigationStack {
                VStack {
                    Divider()
                        .background(.ultraThinMaterial)
                    
                    Spacer()
                    
                    TextField("Username", text: $viewModel.username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    NavigationLink(
                        destination: GitHubDetailView(viewModel: GitHubDetailViewModelFactory.makeGitHubDatailViewModel()),
                        isActive: $isNavigating
                    ) {
                        EmptyView()
                    }
                    
                    Button("Search") {
                        viewModel.fetch()
                        isNavigating = true
                    }
                    .disabled(viewModel.username.isEmpty)
                    
                    Spacer()
                }
                .navigationTitle("GitHub Viewer")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                
                .alert(isPresented: $viewModel.showError) {
                    Alert(
                        title: Text("Error"),
                        message: Text(viewModel.errorMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
    }
    
    #Preview {
        HomeView(viewModel: HomeViewModelFactory.makeHomeViewModel())
    }
