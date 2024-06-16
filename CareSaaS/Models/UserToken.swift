//
//  UserToken.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

struct UserToken: Codable {
    let access_token: String
    let refresh_token: String
}
