//
//  GitHubUser.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

import Foundation

public struct GitHubUser: Codable {
    let login: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
