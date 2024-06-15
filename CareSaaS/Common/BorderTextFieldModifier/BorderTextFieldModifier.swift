//
//  BorderTextFieldModifier.swift
//  CareSaaS
//
//  Created by Obinna on 15/06/2024.
//

import SwiftUI

struct BorderTextFieldModifier: ViewModifier {
    let title: String
    
    var verticalSpacing: CGFloat = 22
    var lineWidth: CGFloat = 2
    var cornerRadius: CGFloat = 8
    var titleHorizontalSpacing: CGFloat = 5

    var titleOffsetX: CGFloat {
        verticalSpacing + 40
    }
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, verticalSpacing)
            .padding(.leading)
            .font(.custom(.regular, size: .size16))
            .foregroundStyle(.labelPrimary)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(.primaryDisabled, lineWidth: lineWidth)
            )
    }
}
