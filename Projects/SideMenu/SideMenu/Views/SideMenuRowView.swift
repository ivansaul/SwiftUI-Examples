//
//  SideMenuRowView.swift
//  SideMenu
//
//  Created by ivansaul on 9/16/24.
//

import SwiftUI

struct SideMenuRowView: View {
    let title: String
    let systemImageName: String
    var isSelected: Bool
    var body: some View {
        HStack {
            Image(systemName: systemImageName)
                .imageScale(.small)
            Text(title)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(8)
        .background(isSelected ? .blue.opacity(0.2) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.leading)
        .animation(.easeIn, value: isSelected)
    }
}

#Preview {
    SideMenuRowView(title: "Message", systemImageName: "paperplane", isSelected: true)
}
