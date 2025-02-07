//
//  Untitled.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//

import SwiftUI

struct HeaderView: View {
    var image: AsyncImage<Image>
    var headerHeight: Double
    var safeArea: EdgeInsets
    var userName: String
    
    init(image: AsyncImage<Image>, viewHeight: Double, safeArea: EdgeInsets, userName: String) {
        self.image = image
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
                image
                    .frame(width: headerHeight * 0.8, height: headerHeight * 0.8)
                    .clipShape(Circle())
                Text(userName)
            }
            .padding(.top, safeArea.top)
            .padding(.bottom, 10)
        }.frame(height: headerHeight + safeArea.top)
       
        
    }
}



