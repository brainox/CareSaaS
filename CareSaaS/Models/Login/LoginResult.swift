//
//  LoginResult.swift
//  CareSaaS
//
//  Created by Obinna on 18/06/2024.
//

import Foundation

// MARK: - LoginResult
struct LoginResult: Codable {
    let status: String
    let code: Int
    let message: String
    let data: LoginData
}

