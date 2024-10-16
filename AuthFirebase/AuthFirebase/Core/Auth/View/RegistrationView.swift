//
//  RegistrationView.swift
//  AuthFirebase
//
//  Created by @ivansaul on 9/17/24.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var fullname: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var authVM: AuthViewModel

    var body: some View {
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
                .keyboardType(.emailAddress)

                InputView(
                    text: $fullname,
                    title: "Full Name",
                    placeholder: "Enter your name"
                )

                InputView(
                    text: $password,
                    title: "Password",
                    placeholder: "Enter your password",
                    isSecureField: true
                )

                InputView(
                    text: $confirmPassword,
                    title: "Confirm Password",
                    placeholder: "Confirm your password",
                    isSecureField: true
                )
                .overlay(alignment: .bottomTrailing) {
                    if (confirmPassword == password) && !password.isEmpty {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                            .padding([.bottom, .trailing], 6.0)
                    } else if !confirmPassword.isEmpty {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.red)
                            .padding([.bottom, .trailing], 6.0)
                    }
                }
            }
            .textInputAutocapitalization(.never)

            // Sign up button
            Button(action: {
                Task {
                    try await authVM.createUser(email: email, password: password, fullname: fullname)
                }
            }, label: {
                HStack {
                    Text("SIGN UP")
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

            // Sing in button

            Button(action: {
                dismiss()
            }, label: {
                HStack {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            })

            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    RegistrationView()
        .environmentObject(AuthViewModel())
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@")
            && !fullname.isEmpty && fullname.count > 3
            && !password.isEmpty && password.count > 5
            && confirmPassword == password
    }
}
