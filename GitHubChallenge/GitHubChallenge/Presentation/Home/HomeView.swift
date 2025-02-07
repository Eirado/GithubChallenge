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
                    
                    TextField("Username", text: $viewModel.userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    NavigationLink(value: viewModel.avatarURL) {
                        Button("Search") {
                            viewModel.fetch()
                        }
                        .disabled(viewModel.userName.isEmpty)
                    }
                    
                    Spacer()
                }
                .navigationTitle("GitHub Viewer")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
    
    #Preview {
        HomeView(viewModel: HomeViewModelFactory.makeHomeViewModel())
    }
