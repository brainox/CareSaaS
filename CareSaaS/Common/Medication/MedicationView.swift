//
//  MedicationView.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI

struct MedicationView: View {
    
    var body: some View {
        List(Array(0...9), id: \.self) { _ in
            ListCellView()
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
        }
        .listRowSpacing(15)
        .listStyle(.plain)
    }
}

#Preview {
    MedicationView()
}
