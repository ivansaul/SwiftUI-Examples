//
//  CardRowView.swift
//  StickyHeader
//
//  Created by @ivansaul on 10/20/24.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct CardRowView: View {
    let card: Card
    var body: some View {
        HStack(spacing: 20) {
            Image(card.image)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(card.title)
                    .fontWeight(.bold)
                
                Text(card.subTitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack(spacing: 12) {
                    Button(action: {}) {
                        Text("GET")
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .background(Color.primary.opacity(0.06))
                            .clipShape(Capsule())
                    }
                    
                    Text("In-App\nPurchases")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    CardRowView(card: Card.preview)
}
