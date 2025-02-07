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
    var userName: String
    var body: some View {
        VStack{
            ZStack{
                
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .frame(height: viewHeight * 0.35)
               
                VStack(spacing: 15){
                    image
                        .resizable()
                        .frame(width: (viewHeight * 0.4) / 2, height: (viewHeight * 0.4) / 2)
                        .clipShape(Circle())
                    Text(userName)
                }
            }
        }
        .ignoresSafeArea(.all, edges: .all)
        
    }
}


