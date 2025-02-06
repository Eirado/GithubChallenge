//
//  Home.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                    .background(.ultraThinMaterial)
                Spacer()
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
               
                NavigationLink {
                    GitHubDetailView(viewModel: GitHubDetailViewModelFactory.makeGitHubDatailViewModel())
                } label: {
                    Button("Search") {
                        viewModel.searchUser()
                    }
                }
//                    .disabled(viewModel.username.isEmpty)
                    
                    Spacer()
                }
                .navigationTitle("GitHub Viewer")
                .navigationBarTitleDisplayMode(.inline)
                
                .alert(isPresented: $viewModel.showError) {
                    Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
    
    #Preview {
        HomeView(viewModel: HomeViewModel())
    }
