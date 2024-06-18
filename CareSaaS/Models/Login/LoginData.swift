//
//  DataClass.swift
//  CareSaaS
//
//  Created by Obinna on 18/06/2024.
//

import Foundation

// MARK: - DataClass
struct LoginData: Codable {
    let user: User
    let userToken: UserToken
}
