//
//  GitHubRepositories.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

import Foundation

public struct GitHubRepo: Codable, Identifiable, Hashable {
    public let id: Int
    let name: String
    let owner: GitHubUser
    let language: String?
}
