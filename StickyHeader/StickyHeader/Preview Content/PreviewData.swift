//
//  PreviewData.swift
//  StickyHeader
//
//  Created by @ivansaul on 10/20/24.
//
//  https://github.com/ivansaul
//

import Foundation

extension [Card] {
    static let preview: [Card] = [
        Card(id: 0, image: "g1", title: "Zombie Gunship Survival", subTitle: "Tour the apocalypse"),
        Card(id: 1, image: "g2", title: "Portal", subTitle: "Travel through dimensions"),
        Card(id: 2, image: "g3", title: "Wave Form", subTitle: "Fun engaging wave game"),
        Card(id: 3, image: "g4", title: "Temple Run", subTitle: "Run for your life"),
        Card(id: 4, image: "g5", title: "World of Warcraft", subTitle: "Be whoever you want"),
        Card(id: 5, image: "g6", title: "Alto’s Adventure", subTitle: "A snowboarding odyssey"),
        Card(id: 6, image: "g7", title: "Space Frog", subTitle: "Jump and have fun"),
        Card(id: 7, image: "g8", title: "Dinosaur Mario", subTitle: "Keep running")
    ]
}

extension Card {
    static let preview: Card = [Card].preview.first!
}
