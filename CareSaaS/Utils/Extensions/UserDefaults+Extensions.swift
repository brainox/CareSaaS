//
//  UserDefaults+Extensions.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

extension UserDefaults {
    static func setDefaults(for key: String, with value: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func getDefaults(for key: String) -> String {
        return UserDefaults.standard.string(forKey: key) ?? ""
    }
}
