//
//  GitHubDetailView.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//
import SwiftUI

struct GitHubDetailView: View {
    let viewModel: GitHubDetailViewModel
    @State private var headerHeight: CGFloat = .zero
    @State private var safeArea: EdgeInsets = .init()
    
    var body: some View {
        
        ZStack {
            VStack {
                HeaderView(image: Image("rainbowlake"), viewHeight: headerHeight, safeAreaTop: safeArea.top, userName: "Name")
                List {
                    
                }
            }
            VStack {
                HStack {
                    CustomBackButton(action: { print(headerHeight, safeArea) })
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
    GitHubDetailView(viewModel: GitHubDetailViewModelFactory.makeGitHubDatailViewModel())
}
