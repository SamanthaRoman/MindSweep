//
//  DesignSystem.swift
//  MindSweep
//
//  Created by Samantha Roman on 4/25/26.
//

import SwiftUI

enum MindSweepDesign {
    static let background = Color(hex: "F5F5F5")
    static let card = Color.white
    static let primaryText = Color(hex: "1C1C1E")
    static let secondaryText = Color(hex: "8E8E93")
    static let softPink = Color(hex: "FFD6E0")
    static let mainPink = Color(hex: "FFC2D1")
    static let quickBlue = Color(hex: "74C7EF")
    static let focusLavender = Color(hex: "C7C4EE")
    static let parkedGray = Color(hex: "C7C7CC")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}
