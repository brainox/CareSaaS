//
//  CustomButton.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var color: Color
    var action: (() -> Void)?
    
    var body: some View {
        Button {
            action?()
        } label: {
            Text(title)
                .apply(theme: .bodyWhiteSolid)
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
    }
}

#Preview {
    CustomButton(title: "Title", color: .blue)
}
