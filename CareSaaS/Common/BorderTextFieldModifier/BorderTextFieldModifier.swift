//
//  BorderTextFieldModifier.swift
//  CareSaaS
//
//  Created by Obinna on 15/06/2024.
//

import SwiftUI

struct BorderTextFieldModifier: ViewModifier {
    let title: String
    let isSecureField: Bool
    @Binding var togglePassword: Bool
    var verticalSpacing: CGFloat = 22
    var lineWidth: CGFloat = 2
    var cornerRadius: CGFloat = 8
    var titleHorizontalSpacing: CGFloat = 5
    
    init(title: String, isSecureField: Bool = false, togglePassword: Binding<Bool> = .constant(false)) {
        self.title = title
        self.isSecureField = isSecureField
        self._togglePassword = togglePassword
    }

    var titleOffsetX: CGFloat {
        verticalSpacing + 40
    }
    
    func body(content: Content) -> some View {
        HStack {
            content
            if isSecureField {
                Button {
                    togglePassword.toggle()
                }label: {
                    Image(systemName: togglePassword ? "eye.slash" : "eye")
                }
                .padding(.trailing)
            }
        }
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
