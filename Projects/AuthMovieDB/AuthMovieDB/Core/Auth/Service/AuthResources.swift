//
//  AuthResource.swift
//  AuthMovieDB
//
//  Created by @ivansaul on 10/12/24.
//
//  https://github.com/ivansaul
//

import Foundation

struct AuthResource: HTTPResource {
    let baseURL: String = APIConstants.apiBaseUrl
    
    let path: String? = APIConstants.Auth.requestToken
    
    let method: HTTPMethod = .GET
    
    let headers: [String: String]? = [
        "content-type": "application/json",
    ]
    
    var query: [String: Any]? = [
        "api_key": APIConstants.apiKey,
    ]
    
    let body: [String: Any]? = nil
}

struct AuthSessionIDResource: HTTPResource {
    private let requestToken: String
    
    init(requestToken: String) {
        self.requestToken = requestToken
    }
    
    let baseURL: String = APIConstants.apiBaseUrl
    
    let path: String? = APIConstants.Auth.requestSessionId
    
    let method: HTTPMethod = .POST
    
    let headers: [String: String]? = [
        "content-type": "application/json",
    ]
    
    var query: [String: Any]? = [
        "api_key": APIConstants.apiKey,
    ]
    
    var body: [String: Any]? {
        [
            "request_token": requestToken,
        ]
    }
}
