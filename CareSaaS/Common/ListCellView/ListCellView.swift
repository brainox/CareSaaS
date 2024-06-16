//
//  ListCellView.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI

struct ListCellView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("4 Medications to take")
                    Spacer()
                    Image("arrow-alt-circle-up")
                }
                Spacer()
                ImageTextView(image: "user", text: "James")
                Spacer()
                HStack {
                    HStack(spacing: 16) {
                        ImageTextView(image: "door-open-solid", text: "RM 3A")
                        ImageTextView(image: "bed-solid", text: "Bed 45")
                    }
                    Spacer()
                    ImageTextView(image: "clock-solid", text: "9:00 AM")
                }
            }
            .padding()
        }
        .background(.primaryLightDisabled)
        .foregroundColor(.labelPrimary)
        .cornerRadius(8)
    }
}

#Preview {
    ListCellView()
}
