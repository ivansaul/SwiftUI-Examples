//
//  User.swift
//  AuthFirebase
//
//  Created by @ivansaul on 9/17/24.
//
//  https://github.com/ivansaul
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String

    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

extension User {
    static var MOCK_USER = User(
        id: NSUUID().uuidString,
        fullname: "Ivan Saul",
        email: "ish@email.com"
    )
}
