//
//  UserDefaults+Extensions.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

extension UserDefaults {
    static func setAssignee(with value: String) {
        UserDefaults.standard.set(value, forKey: "assignee")
    }
    
    static func getAssignee() -> String {
        return UserDefaults.standard.string(forKey: "awesomeValue") ?? ""
    }
}
