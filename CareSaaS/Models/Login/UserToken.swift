//
//  UserToken.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

struct UserToken: Codable {
    let accessToken: String
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
