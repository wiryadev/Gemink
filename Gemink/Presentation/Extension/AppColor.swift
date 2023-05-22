//
//  ColorExtension.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 21/05/23.
//

import SwiftUI

extension Color {
    init(hex: Int64, alpha: Double = 1) {
            self.init(
                .sRGB,
                red: Double((hex >> 16) & 0xff) / 255,
                green: Double((hex >> 08) & 0xff) / 255,
                blue: Double((hex >> 00) & 0xff) / 255,
                opacity: alpha
            )
        }
    static let eerieBlack = Color(hex: 0xFF202020)
    static let nightBlack = Color(hex: 0xFF151515)
    static let dimGray = Color(hex: 0xFF6D6D6D)
}

extension UIColor {
    static let eerieBlack = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.00)
    static let nightBlack = UIColor(red: 0.08, green: 0.08, blue: 0.08, alpha: 1.00)
}
