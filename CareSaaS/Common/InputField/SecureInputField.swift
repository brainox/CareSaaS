//
//  SecureInputField.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI

struct SecureInputField: View {
    var title: String
    var validationText: String
    @Binding var textFieldState: TextFieldState
    @Binding var text: String
    @Binding var isShowingPassword: Bool
    
    init(title: String,
         validationText: String,
         text: Binding<String>,
         textFieldState: Binding<TextFieldState>,
         isShowingPassword: Binding<Bool> = .constant(false)) {
        self.title = title
        self.validationText = validationText
        self._textFieldState = textFieldState
        self._text = text
        self._isShowingPassword = isShowingPassword
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                Text(title)
                    .font(.custom(.regular, size: .size16))
                    .foregroundStyle(text.isEmpty ? Color(.labelPrimary) : Color(.bodyMediumEmphasis))
                    .offset(y: text.isEmpty ? 0 : -20)
                    .scaleEffect(text.isEmpty ? 1 : 0.7, anchor: .leading)
                    .padding(.leading)
                if isShowingPassword {
                    SecureField("", text: $text)
                        .borderTextField(title: "Username", isSecureField: true, isShowingPassword: $isShowingPassword)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                } else {
                    TextField("", text: $text)
                        .borderTextField(title: "Username", isSecureField: true, isShowingPassword: $isShowingPassword)
                }
            }
            .animation(.default)
            if textFieldState == .invalid {
                Text(validationText)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    SecureInputField(title: "Password", validationText: "Password must be at least 8 characters long", text: .constant("Password"), textFieldState: .constant(.invalid), isShowingPassword: .constant(true))
}
