//
//  GitHubDetailView.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//
import SwiftUI

struct GitHubDetailView: View {
    var body: some View {
        ScrollView {
            Rectangle()
                .frame(height: 200)
            CircleImage(image: Image("rainbowlake"))
                .offset(y: -160)
                .padding(.bottom, -130)
        }
    }
}

#Preview {
    GitHubDetailView()
}
