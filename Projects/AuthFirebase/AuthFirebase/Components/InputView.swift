//
//  InputView.swift
//  AuthFirebase
//
//  Created by @ivansaul on 9/17/24.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text(title)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(Color(.darkGray))

            ZStack {
                if isSecureField {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            .font(.system(size: 14))
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

#Preview {
    InputView(
        text: .constant(""),
        title: "Email Adress",
        placeholder: "name@email.com",
        isSecureField: false
    )
}
