//
//  AuthViewModel.swift
//  AuthFirebase
//
//  Created by @ivansaul on 9/17/24.
//
//  https://github.com/ivansaul
//

import Firebase
import FirebaseAuth
import FirebaseFirestore
import Foundation

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    init() {
        self.userSession = Auth.auth().currentUser

        Task {
            await self.fetchUser()
        }
    }

    func signIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await self.fetchUser()
        } catch {
            print("DEBUG: Failed to LogIn with erro: \(error.localizedDescription)")
        }
    }

    func createUser(email: String, password: String, fullname: String) async throws {
        print("Create user ...")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await self.fetchUser()
        } catch {
            print("DEBUG: Failed to create a user with error: \(error.localizedDescription)")
        }
    }

    func signOut() async {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error: \(error.localizedDescription)")
        }
    }

    func deleteAccount() async {
        do {
            try await Auth.auth().currentUser?.delete()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to delete account with error: \(error.localizedDescription)")
        }
    }

    private func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
    }
}
