//
//  HomeView.swift
//  StickyHeader
//
//  Created by @ivansaul on 10/20/24.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct HomeView: View {
    @State private var showHeader: Bool = false
    @State private var viewModel: ViewModel = .init()
    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .tracking).autoconnect()

    private let posterHight = 300.0

    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                // Poster
                poster

                // Games List
                gamesList
            }
            .scrollIndicators(.hidden)

            // Header
            if showHeader {
                HeaderView()
            }
        }
        .ignoresSafeArea()
        .task { await viewModel.fetchCards() }
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    private var poster: some View {
        GeometryReader { proxy in
            Image(.poster)
                .resizable()
                .offset(y: -1)
                .frame(height: getFrameHeight(proxy: proxy))
                .offset(y: getOffset(proxy: proxy))
                .onReceive(timer, perform: { _ in
                    let y = proxy.frame(in: .global).minY
                    let percentage = -y / posterHight
                    if percentage > 0.51 {
                        withAnimation(.spring()) { showHeader = true }
                    } else {
                        withAnimation(.spring()) { showHeader = false }
                    }
                })
        }
        .frame(height: posterHight)
    }

    private var gamesList: some View {
        VStack {
            HStack {
                Text("New Games We Love")
                    .font(.title)
                    .fontWeight(.bold)

                Spacer()

                Button(action: {}) {
                    Text("See All")
                        .fontWeight(.bold)
                }
            }

            ForEach(viewModel.cards) { card in
                CardRowView(card: card)
            }
        }
        .padding(.horizontal)
    }
}

extension HomeView {
    private func getFrameHeight(proxy: GeometryProxy) -> Double {
        let y = proxy.frame(in: .global).minY
        if y > 0 {
            return posterHight + y
        }
        return posterHight
    }

    private func getOffset(proxy: GeometryProxy) -> Double {
        let y = proxy.frame(in: .global).minY
        if y > 0 {
            return -y
        }
        return 0
    }
}
