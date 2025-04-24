//
//  APITarget.swift
//  GitHubChallenge
//
//  Created by Gabriel Amaral on 07/02/25.
//



import Foundation

// TODO implement OCP here
// TODO pass information safely by parameters

public enum APITarget {
    case getRepos(userName: String)
    
    private var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    private var path: String {
        switch self {
        case .getRepos(let userName):
            return "/users/\(userName)/repos"
        }
    }

    var method: String {
        return "GET"
    }

    var parameters: [String: Any] {
        return [:]
    }

    var headers: [String: String] {
        return ["Content-Type": "application/json"]
    }

    public var url: URL {
        return baseURL.appendingPathComponent(path)
    }
}

