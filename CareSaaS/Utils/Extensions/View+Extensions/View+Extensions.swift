//
//  View+Extensions.swift
//  CareSaaS
//
//  Created by Obinna on 15/06/2024.
//

import SwiftUI

extension View {
  func borderTextField(title: String) -> some View {
    modifier(BorderTextFieldModifier(title: title))
  }
}
