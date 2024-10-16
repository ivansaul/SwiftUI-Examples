//
//  SettingsRowView.swift
//  AuthFirebase
//
//  Created by @ivansaul on 9/17/24.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct SettingsRowView<Leading: View, Trailing: View>: View {
    let title: String
    let leading: Leading
    let trailing: Trailing?

    init(title: String, @ViewBuilder leading: () -> Leading, @ViewBuilder trailing: () -> Trailing) {
        self.title = title
        self.leading = leading()
        self.trailing = trailing()
    }

    init(title: String, @ViewBuilder leading: () -> Leading) where Trailing == EmptyView {
        self.title = title
        self.leading = leading()
        self.trailing = nil
    }

    var body: some View {
        HStack {
            leading

            Text(title)
                .font(.subheadline)
            Spacer()
            if let trailing = trailing {
                trailing
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    SettingsRowView(title: "Settings") {
        Image(systemName: "gear")
    } trailing: {
        Text("1.0.0")
    }
}
