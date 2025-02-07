//
//  APITarget.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//

import Foundation

public enum APITarget {
    case getGitHubRepos(userName: String)
    
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    var path: String {
        switch self {
        case .getGitHubRepos(let userName):
            return "/users/\(userName)/repos"
        }
    }

    var method: String {
        switch self {
        case .getGitHubRepos:
            return "GET"
        }
    }

    var task: [String: Any] {
        switch self {
        case .getGitHubRepos:
            return [:] 
        }
    }

    var headers: [String: String] {
        return ["Content-Type": "application/json"]
    }

    var url: URL {
        return baseURL.appendingPathComponent(path)
    }
}
