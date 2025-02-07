//
//  Untitled.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//

import SwiftUI

struct HeaderView: View {
    var image: Image
    var viewHeight: Double
    var safeAreaTop: Double
    var userName: String
    var body: some View {
        VStack {
            ZStack{
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .frame(height: viewHeight + safeAreaTop)
                    .overlay(
                        Rectangle()
                            .stroke(.gray, lineWidth: 1)
                    )
                
                VStack(spacing: 15){
                    image
                        .resizable()
                        .frame(width: viewHeight * 0.6, height: viewHeight * 0.6)
                        .clipShape(Circle())
                    Text(userName)
                }.offset(y: 20)
            }.ignoresSafeArea(.all, edges: .all)
        }
        
    }
}



