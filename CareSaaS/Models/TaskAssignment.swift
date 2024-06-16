//
//  TaskAssignment.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

// Model for TaskAssignment
struct TaskAssignment: Decodable {
    let assignee: Assignee
    let assignmentStatus: String
}
