//
//  GitHubDetailView.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//
import SwiftUI

struct GitHubDetailView: View {
    let viewModel: GitHubDetailViewModel
    @State private var viewHeight: CGFloat = .zero
    

    var body: some View {
        
        ZStack {
            VStack {
                
                HeaderView(image: Image("rainbowlake"), viewHeight: viewHeight, userName: "Name")
                CustomBackButton(action: { print("something") })
                
                List {
                    
                }
                
                
                
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        }.background {
            GeometryReader { geo in
                Color.clear
                    .onAppear{
                        viewHeight = geo.size.height
                        
                    }
            }.ignoresSafeArea(.all)
        }
    }
}

#Preview {
    GitHubDetailView(viewModel: GitHubDetailViewModelFactory.makeGitHubDatailViewModel())
}
