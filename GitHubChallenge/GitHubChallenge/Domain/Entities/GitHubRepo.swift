//
//  GitHubRepositories.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

import Foundation

public struct GitHubRepo: Decodable {
    let name: String
    let programmingLanguage: String?
    let owner: GitHubUser
}
