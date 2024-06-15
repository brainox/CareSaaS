//
//  TextTheme.swift
//  CareSaaS
//
//  Created by Obinna on 15/06/2024.
//

import SwiftUI

/// Theme that willbe used for SwiftUI Text.
struct TextTheme: Hashable {
    
    // MARK: - Properties
    
    /// The text font.
    var font: Font
    
    /// The text Color.
    var color: Color
    
    // MARK: Initializers
    
    /// Initializes the theme for the SwiftUI Text with the given paremeters.
    /// - Parameters:
    ///   - font: some text font.
    ///   - color: some text color.
    init(font: Font, color: Color) {
        self.font = font
        self.color = color
    }
}
