//
//  AuthMovieDBApp.swift
//  AuthMovieDB
//
//  Created by @ivansaul on 10/12/24.
//
//  https://github.com/ivansaul
//

import SwiftUI

@main
struct AuthMovieDBApp: App {
    @State private var authViewModel: AuthViewModel
    init() {
        let authService = AuthService()
        _authViewModel = State(wrappedValue: AuthViewModel(authService: authService))
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authViewModel)
        }
    }
}
