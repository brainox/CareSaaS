//
//  Assignee.swift
//  CareSaaS
//
//  Created by Obinna on 18/06/2024.
//

import Foundation

// MARK: - Assignee
struct Assignee: Codable, Equatable {
    let userID: Int
    let firstName, lastName: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case firstName, lastName
    }
}
