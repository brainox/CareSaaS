//
//  TextThemeModifier.swift
//  CareSaaS
//
//  Created by Obinna on 15/06/2024.
//

import SwiftUI

/// TextThemeModifier is used to apply custom text theme.
struct TextThemeModifier: ViewModifier {
    
    // MARK: - Properties
    
    /// Theme that will be applied for the text (font, color..)
    let theme: TextTheme
    
    // MARK: - View Modifier Conformance
    
    func body(content: Content) -> some View {
        content
            .font(theme.font)
            .foregroundColor(theme.color)
    }
}
