//
//  GitHubDetailView.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//
import SwiftUI

struct GitHubDetailsView: View {
    let viewModel: GitHubDetailsViewModel
    let avatarURL: String
    let userName: String
    let gitHubRepos: [GitHubRepo]
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                VStack {
                    HeaderView(avatarURL: avatarURL, viewHeight: geometry.size.height, safeArea: geometry.safeAreaInsets, userName: userName).padding(.zero)
                    
                    List {
                        ForEach(gitHubRepos) { repo in
                            GitHubDetailListCell(repoName: repo.name, repoProgrammingLanguage: repo.language ?? "")
                        }
                    }.listStyle(.plain)
                    
                }.ignoresSafeArea(.all, edges: .top)
                VStack {
                    HStack {
                        CustomBackButton(action: { presentationMode.wrappedValue.dismiss() })
                            .padding(.leading, 16)
                            .padding(.top, 5)
                        Spacer()
                    }
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    GitHubDetailsView(viewModel: GitHubDetailsViewModelFactory.makeHomeViewModel(), avatarURL: "https://avatars.githubusercontent.com/u/111468283?v=4", userName: "random", gitHubRepos: [GitHubRepo(id: 214124, name: "mockName", owner: GitHubUser(login: "mockUserName", avatarURL: ""), language: "swift"), GitHubRepo(id: 214124, name: "mockName", owner: GitHubUser(login: "mockUserName", avatarURL: ""), language: "swift"), GitHubRepo(id: 214124, name: "mockName", owner: GitHubUser(login: "mockUserName", avatarURL: ""), language: "swift")])
}
