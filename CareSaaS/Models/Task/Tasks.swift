//
//  Tasks.swift
//  CareSaaS
//
//  Created by Obinna on 18/06/2024.
//

import Foundation

// MARK: - Tasks
struct Tasks: Codable, Identifiable, Equatable {
    var id: Int {
        userID
    }
    let taskID, userID: Int
    let taskDetailRef, timeOfDay, hourOfDay, supportLevel: String
    let action, taskGroup, taskType: String
    let order: Int
    let priority, supportPersonnel: String
    let numSupportPersonnel: Int
    let cron, taskDate, taskStartedOn, taskEndedOn: String
    let workStatus: String
    let taskAssignments: [TaskAssignment]

    enum CodingKeys: String, CodingKey {
        case taskID = "taskId"
        case userID = "userId"
        case taskDetailRef, timeOfDay, hourOfDay, supportLevel, action, taskGroup, taskType, order, priority, supportPersonnel, numSupportPersonnel, cron, taskDate, taskStartedOn, taskEndedOn, workStatus, taskAssignments
    }
}
