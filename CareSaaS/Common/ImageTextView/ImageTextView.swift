//
//  ImageTextView.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI

struct ImageTextView: View {
    
    // MARK: - Properties
    
    let image: String
    let text: String
    
    // MARK: - View Conformance
    
    var body: some View {
        HStack(spacing: 8) {
            Image(image)
                .foregroundStyle(.labelPrimary)
            Text(text)
                .apply(theme: .labelPrimaryCellTitle)
        }
    }
}

