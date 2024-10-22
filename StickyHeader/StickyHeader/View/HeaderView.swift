//
//  HeaderView.swift
//  StickyHeader
//
//  Created by @ivansaul on 10/20/24.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct HeaderView: View {
    private var topPadding: CGFloat {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene?.windows.first?.safeAreaInsets.top ?? 20
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top) {
                    Image("apple")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 25, height: 30)
                        .foregroundStyle(.primary)

                    Text("Arcade")
                        .font(.title)
                        .fontWeight(.bold)
                }

                Text("One Month free, then $4.99/month.")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }

            Spacer()

            Button(action: {}) {
                Text("Try It Free")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(Color.blue)
                    .clipShape(Capsule())
            }
        }
        .padding([.leading, .bottom, .trailing])
        .padding(.top, topPadding)
        .background(.thickMaterial)
    }
}

#Preview {
    HeaderView()
}
