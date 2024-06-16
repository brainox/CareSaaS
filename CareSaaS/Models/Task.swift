//
//  Task.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

// Main model for Task
struct Task: Decodable {
    let taskId: Int
    let userId: Int
    let taskDetailRef: String
    let timeOfDay: String
    let hourOfDay: String
    let supportLevel: String
    let action: String
    let taskGroup: String
    let taskType: String
    let order: Int
    let priority: String
    let supportPersonnel: String
    let numSupportPersonnel: Int
    let cron: String
    let taskDate: String
    let taskStartedOn: String
    let taskEndedOn: String
    let workStatus: String
    let taskAssignments: [TaskAssignment]
}
