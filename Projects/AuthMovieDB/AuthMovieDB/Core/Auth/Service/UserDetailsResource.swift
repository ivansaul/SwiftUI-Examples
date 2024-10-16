//
//  UserDetailsResource.swift
//  AuthMovieDB
//
//  Created by @ivansaul on 10/13/24.
//
//  https://github.com/ivansaul
//

import Foundation

struct UserDetailsResource: HTTPResource {
    private let sessionID: String
    
    init(sessionID: String) {
        self.sessionID = sessionID
    }

    let baseURL: String = APIConstants.apiBaseUrl
    
    var path: String? {
        APIConstants.Account.details
    }
    
    let method: HTTPMethod = .GET
    
    let headers: [String: String]? = [
        "content-type": "application/json",
    ]
    
    var query: [String: Any]? {
        [
            "api_key": APIConstants.apiKey,
            "session_id": sessionID,
        ]
    }
    
    let body: [String: Any]? = nil
}
