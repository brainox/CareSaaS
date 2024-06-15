//
//  CheckboxToggleStyle.swift
//  CareSaaS
//
//  Created by Obinna on 15/06/2024.
//

import SwiftUI

struct CheckedboxToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .foregroundColor(.checkbox)
                .frame(width: 18, height: 18)
                .onTapGesture { configuration.isOn.toggle() }
                .padding(.trailing, 2.5)
            
            configuration.label
        }
    }
}
