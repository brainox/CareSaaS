//
//  View+TextStyle.swift
//  CareSaaS
//
//  Created by Obinna on 15/06/2024.
//

import SwiftUI

// MARK: - View with custom theme

extension View {
    
    /// Will return View with custom theme
    /// - Parameter theme: theme for the text
    /// - Returns: some View
    func apply(theme: TextTheme) -> some View {
        modifier(TextThemeModifier(theme: theme))
    }
}
