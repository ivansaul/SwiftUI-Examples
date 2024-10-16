//
//  PreviewData.swift
//  AuthMovieDB
//
//  Created by @ivansaul on 10/15/24.
//
//  https://github.com/ivansaul
//

import Foundation

extension UserModel {
    static var preview: UserModel {
        let url = Bundle.main.url(forResource: "UserDetails", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return try! JSONDecoder().decode(UserModel.self, from: data)
    }
}
