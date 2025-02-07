//
//  GitHubRepositories.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

import Foundation

public struct GitHubRepo: Codable {
    let name: String
    let owner: GitHubUser
    let language: String?
}
