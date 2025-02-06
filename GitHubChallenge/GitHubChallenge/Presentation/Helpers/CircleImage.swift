//
//  Untitled.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 06/02/25.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("rainbowlake"))
}
