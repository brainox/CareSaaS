//
//  InputField.swift
//  CareSaaS
//
//  Created by Obinna on 15/06/2024.
//

import SwiftUI

struct InputField: View {
    var title: String
    @Binding var textFieldState: TextFieldState
    @Binding var text: String

    init(title: String, text: Binding<String>, textFieldState: Binding<TextFieldState>) {
        self.title = title
        self._textFieldState = textFieldState
        self._text = text
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
                TextField("", text: $text)
                    .borderTextField(title: "Username")
            }
            .animation(.default)
            if textFieldState == .invalid {
                Text("Username must be at least 4 characters long")
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    InputField(title: "Username", text: .constant("Username"), textFieldState: .constant(.invalid))
}
