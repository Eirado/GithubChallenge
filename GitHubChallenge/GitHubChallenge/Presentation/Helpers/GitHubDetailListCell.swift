//
//  GitHubDetailListCell.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

import SwiftUI


struct GitHubDetailListCell: View {
    
    var repoName: String
    var repoProgrammingLanguage: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text(repoName)
                .font(.title)
            Text(repoProgrammingLanguage)
        }
    }
}
