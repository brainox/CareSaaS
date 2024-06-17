//
//  User.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

struct User: Codable {
    let sub: String?
    let emailVerified: Bool?
    let realmAccess: RealmAccess?
    let name: String?
    let preferredUsername: String?
    let givenName: String?
    let userId: String?
    let familyName: String?
    let email: String?
    let organization: String?
    let careHome: String?
    
    enum CodingKeys: String, CodingKey {
        case sub
        case emailVerified = "email_verified"
        case realmAccess = "realm_access"
        case name
        case preferredUsername = "preferred_username"
        case givenName = "given_name"
        case userId = "userId"
        case familyName = "family_name"
        case email
        case organization
        case careHome = "careHome"
    }
}
