//
//  GitHubDetailView.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//
import SwiftUI

struct GitHubDetailView: View {
//    let viewModel: GitHubDetailViewModel
    let avatarURL: String
    let userName: String
    let gitHubRepos: [GitHubRepo]
    
    @State private var headerHeight: CGFloat = .zero
    @State private var safeArea: EdgeInsets = .init()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        ZStack {
            VStack {
                HeaderView(image: Image(avatarURL), viewHeight: headerHeight, safeAreaTop: safeArea.top, userName: userName)
                List {
                    ForEach(gitHubRepos) { repo in
                        GitHubDetailListCell(repoName: repo.name, repoProgrammingLanguage: repo.language ?? "")
                    }
                }.listStyle(.plain)
            }
            VStack {
                HStack {
                    CustomBackButton(action: { presentationMode.wrappedValue.dismiss() })
                        .padding(.leading, 16)
                        .padding(.top, 5)
                    Spacer()
                }
                Spacer()
            }
        }.background {
            GeometryReader { geo in
                Color.clear
                    .onAppear{
                        headerHeight = (geo.size.height * 0.3)
                        safeArea = geo.safeAreaInsets
                    }
            }.ignoresSafeArea(.all)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GitHubDetailView(avatarURL: "random", userName: "random", gitHubRepos: [])
}
