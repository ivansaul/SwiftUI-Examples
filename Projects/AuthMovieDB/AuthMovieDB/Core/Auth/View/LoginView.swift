//
//  LoginView.swift
//  AuthMovieDB
//
//  Created by @ivansaul on 10/12/24.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct LoginView: View {
    @Environment(AuthViewModel.self) private var authViewModel

    var body: some View {
        @Bindable var authViewModel = authViewModel
        VStack(spacing: 20.0) {
            Image(.tmdbLogo)
                .resizable()
                .scaledToFit()
                .frame(width: 150)

            Text("Sign in or create a FREE account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.gray)

            Text("Join now to subscribe to your favorite shows, like episodes, follow friends, create custom playlists, and discover so much more!")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.bottom, 20)

            Button(action: {
                Task { await authViewModel.signIn() }
            }, label: {
                Text("Sign in with TMDM")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            })
            .disabled(authViewModel.isLoading ? true : false)
            .opacity(authViewModel.isLoading ? 0.5 : 1.0)
        }
        .multilineTextAlignment(.center)
        .padding()
        .alert("Some Error Occur", isPresented: $authViewModel.showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(authViewModel.errorMessage)
        }
    }
}

#Preview {
    LoginView()
        .environment(AuthViewModel(authService: MockAuthService()))
}
