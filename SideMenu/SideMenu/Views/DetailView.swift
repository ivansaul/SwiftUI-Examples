//
//  DetailView.swift
//  SideMenu
//
//  Created by ivansaul on 9/16/24.
//

import SwiftUI

struct DetailView: View {
    let systemImageName: String
    var body: some View {
        ZStack {
            // Background Color
            Color.theme.background
                .ignoresSafeArea()
            // Content
            Image(systemName: systemImageName)
                .font(.largeTitle)
        }
    }
}

#Preview {
    DetailView(systemImageName: "paperplane")
}
