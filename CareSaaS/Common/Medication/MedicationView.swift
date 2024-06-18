//
//  MedicationView.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI

struct MedicationView: View {
    
    // MARK: - Properties
    
    let tasks: [Tasks]
    
    // MARK: - View Conformance
    
    var body: some View {
        List(tasks, id: \.id) { task in
            ListCellView(title: task.action ,
                         assignee: task.taskAssignments.first?.assignee.firstName ?? "",
                         door: task.workStatus ,
                         bed: task.supportLevel ,
                         time: task.timeOfDay )
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
        }
        .listRowSpacing(15)
        .listStyle(.plain)
    }
}
