//
//  ContentView.swift
//  AuthFirebase
//
//  Created by @ivansaul on 9/17/24.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var authVM: AuthViewModel

    var body: some View {
        Group {
            if authVM.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
