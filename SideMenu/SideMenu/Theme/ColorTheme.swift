//
//  ColorTheme.swift
//  SideMenu
//
//  Created by ivansaul on 9/16/24.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    // BACkGROUND COLO
    let background = Color("BackgroundColor")

    // PRIMARY COLORS
    let primaryBlue = Color("PrimaryColorBlue")

    // TEXT COLORS
    let textBlack = Color("TextColorBlack")
    let textWhite = Color("TextColorWhite")
}
