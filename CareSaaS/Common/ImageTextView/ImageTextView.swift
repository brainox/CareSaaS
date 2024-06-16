//
//  ImageTextView.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI

struct ImageTextView: View {
    let image: String
    let text: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(image)
                .foregroundStyle(.labelPrimary)
            Text(text)
                .apply(theme: .labelPrimaryCellTitle)
        }
    }
}

