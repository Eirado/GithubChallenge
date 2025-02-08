//
//  Untitled.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//

import SwiftUI

struct HeaderView: View {
    var avatarURL: String
    var headerHeight: Double
    var safeArea: EdgeInsets
    var userName: String
    
    init(avatarURL: String, viewHeight: Double, safeArea: EdgeInsets, userName: String) {
        self.avatarURL = avatarURL
        self.headerHeight = viewHeight * 0.3
        self.safeArea = safeArea
        self.userName = userName
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.ultraThinMaterial)
                .overlay(
                    Rectangle()
                        .stroke(.gray, lineWidth: 1)
                )
            VStack(spacing: 15){
                AsyncImage(url: URL(string: avatarURL)) { phase in
                    if let image = phase.image {
                        image.resizable()
                                .clipShape(Circle())
                                .frame(width: headerHeight * 0.8, height: headerHeight * 0.8)
                                .aspectRatio(contentMode: .fit)
                    }
                }
                Text(userName)
            }
            .padding(.top, safeArea.top)
            .padding(.bottom, 10)
        }.frame(height: headerHeight + safeArea.top)
    }

}



