//
//  ListCellView.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI

struct ListCellView: View {
    
    // MARK: - Properties
    
    let title: String
    let assignee: String
    let door: String
    let bed: String
    let time: String
    
    // MARK: - View Conformance
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                    Spacer()
                    Image("arrow-alt-circle-up")
                }
                Spacer()
                ImageTextView(image: "user", text: assignee)
                Spacer()
                HStack {
                    HStack(spacing: 16) {
                        ImageTextView(image: "door-open-solid", text: door)
                        ImageTextView(image: "bed-solid", text: bed)
                    }
                    Spacer()
                    ImageTextView(image: "clock-solid", text: time)
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
    ListCellView(title: "4 Medications to take", assignee: "James", door: "Room 4", bed: "Bed 45", time: "9:00 AM")
}
