//
//  ContentView.swift
//  AuthMovieDB
//
//  Created by @ivansaul on 10/12/24.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct ContentView: View {
    @Environment(AuthViewModel.self) private var authViewModel
    var body: some View {
        NavigationStack {
            Group {
                switch authViewModel.authStatus {
                case .checking:
                    ProgressView()
                case .loggedIn:
                    ProfileView()
                case .loggedOut:
                    LoginView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(AuthViewModel(authService: MockAuthService()))
}
