//
//  TaskAssignment.swift
//  CareSaaS
//
//  Created by Obinna on 18/06/2024.
//

import Foundation

// MARK: - TaskAssignment
struct TaskAssignment: Codable, Equatable {
    let assignee: Assignee
    let assignmentStatus: String
}
