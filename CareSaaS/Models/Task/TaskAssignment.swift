//
//  TaskAssignment.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

// Model for TaskAssignment
struct TaskAssignment: Codable {
    let assignee: Assignee?
    let assignmentStatus: String?
}
