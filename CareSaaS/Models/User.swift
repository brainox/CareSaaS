//
//  User.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

struct User: Codable {
    let sub: String
    let email_verified: Bool
    let realm_access: RealmAccess
    let name: String
    let preferred_username: String
    let given_name: String
    let userId: String
    let family_name: String
    let email: String
    let organization: String
    let careHome: String
}
