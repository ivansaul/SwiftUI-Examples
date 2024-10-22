//
//  ViewModel.swift
//  StickyHeader
//
//  Created by @ivansaul on 10/20/24.
//
//  https://github.com/ivansaul
//

import Foundation

@Observable
final class ViewModel {
    private(set) var cards: [Card] = []

    @MainActor
    func fetchCards() async {
        cards = [Card].preview
    }
}
