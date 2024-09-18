//
//  LoginView.swift
//  AuthFirebase
//
//  Created by @ivansaul on 9/17/24.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject private var authVM: AuthViewModel

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Image
                Image("firebase-logo")
                    .resizable()
                    .frame(width: 150, height: 170)
                    .scaledToFit()

                // Form Fields
                VStack(spacing: 20.0) {
                    InputView(
                        text: $email,
                        title: "Email Adress",
                        placeholder: "name.email.com"
                    )
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)

                    InputView(
                        text: $password,
                        title: "Password",
                        placeholder: "Enter your password",
                        isSecureField: true
                    )
                }

                // Sign in button
                Button(action: {
                    Task {
                        try await authVM.signIn(email: email, password: password)
                    }
                }, label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color(.systemBlue))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1 : 0.5)

                // Sing up button

                NavigationLink {
                    RegistrationView()
                } label: {
                    HStack {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@")
            && !password.isEmpty && password.count > 5
    }
}
