//
//  ProfileView.swift
//  AuthFirebase
//
//  Created by @ivansaul on 9/17/24.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var authVM: AuthViewModel

    var body: some View {
        VStack {
            List {
                Section {
                    userSection(authVM.currentUser)
                }

                Section("General") {
                    SettingsRowView(title: "Version") {
                        Image(systemName: "gear")
                            .foregroundStyle(.gray)
                    } trailing: {
                        Text("1.0.0")
                            .foregroundStyle(.gray)
                    }
                }

                Section("Account") {
                    Button(action: {
                        Task {
                            await authVM.signOut()
                        }
                    }, label: {
                        SettingsRowView(title: "Sign Out") {
                            Image(systemName: "arrowshape.turn.up.left.circle.fill")
                                .foregroundStyle(.red)
                        }
                        .tint(.black)
                    })

                    Button(action: {
                        Task {
                            await authVM.deleteAccount()
                        }
                    }, label: {
                        SettingsRowView(title: "Delete Account") {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.red)
                        }
                        .tint(.black)
                    })
                }
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}

extension ProfileView {
    private func userSection(_ user: User?) -> some View {
        HStack {
            Text(user?.initials ?? "")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(width: 72, height: 72)
                .background(.gray)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(user?.fullname ?? "")
                    .font(.headline)
                Text(user?.email ?? "")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
        }
    }
}
