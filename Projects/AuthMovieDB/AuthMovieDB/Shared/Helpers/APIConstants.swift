//
//  APIConstants.swift
//  AuthMovieDB
//
//  Created by @ivansaul on 10/12/24.
//
//  https://github.com/ivansaul
//

import Foundation

enum APIConstants {
    static let apiBaseUrl = "https://api.themoviedb.org"
    static let apiKey = "YOUR_API_KEY"
    static let movieDBUrlScheme = "MovieDBAuthScheme"
    static let movieDBUrl = "https://www.themoviedb.org"

    enum Auth {
        static let authenticate = "/authenticate"
        static let requestToken = "/3/authentication/token/new"
        static let requestSessionId = "/3/authentication/session/new"
    }

    enum Account {
        static let details = "/3/account/account_id"
    }

    enum Keys {
        static let sessionID = "sessionIDKey"
    }
}
