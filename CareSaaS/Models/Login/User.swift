//
//  User.swift
//  CareSaaS
//
//  Created by Obinna on 18/06/2024.
//

import Foundation

// MARK: - User
struct User: Codable {
    let sub: String
    let emailVerified: Bool
    let realmAccess: RealmAccess
    let organization, name: String
    let groups: [String]
    let preferredUsername, givenName, familyName, userID: String
    let email, lastRole: String

    enum CodingKeys: String, CodingKey {
        case sub
        case emailVerified = "email_verified"
        case realmAccess = "realm_access"
        case organization, name, groups
        case preferredUsername = "preferred_username"
        case givenName = "given_name"
        case familyName = "family_name"
        case userID = "userId"
        case email, lastRole
    }
}
