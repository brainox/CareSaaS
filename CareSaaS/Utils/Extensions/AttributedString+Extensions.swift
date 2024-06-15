//
//  Text+Extensions.swift
//  CareSaaS
//
//  Created by Obinna on 15/06/2024.
//

import SwiftUI

extension AttributedString {
    mutating func setStyle(for phrases: [String], font: Font, color: Color) {
        for phrase in phrases {
            if let range = self.range(of: phrase) {
                self[range].font = font
                self[range].foregroundColor = color
            }
        }
    }
}

func makeAttributedString(_ text: String, for phrases: [String]) -> AttributedString {
    var attributedString = AttributedString(text)
    attributedString.font = .custom(.regular, size: .size13)
    attributedString.foregroundColor = .bodyMediumEmphasis
    let font = Font.custom(.regular, size: .size13)
    let color = Color(.primaryHighEmphasis)
    attributedString.setStyle(for: phrases, font: font, color: color)
    return attributedString
}
