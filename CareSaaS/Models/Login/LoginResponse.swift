//
//  LoginResponse.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

struct LoginResponse: Codable {
    let user: User?
    let userToken: UserToken?
}


struct LoginResult: Codable {
    let code: Int
    let data: LoginResponse
    let message: String
    let status: Bool
}
