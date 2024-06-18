//
//  TaskModel.swift
//  CareSaaS
//
//  Created by Obinna on 18/06/2024.
//

import Foundation

// MARK: - TaskResult
struct TaskResult: Codable {
    let status: String
    let code: Int
    let message: String
    let data: [Tasks]
}

