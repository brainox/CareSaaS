//
//  UserToken.swift
//  CareSaaS
//
//  Created by Obinna on 18/06/2024.
//

import Foundation

// MARK: - UserToken
struct UserToken: Codable {
    let accessToken, refreshToken: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
