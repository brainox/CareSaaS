//
//  Environment.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

enum Environment {
    
    static var baseURL: URL {
        URL(string: "https://api.staging.caresaas.co.uk/caresaas/v1/services/")!
    }

    static var accessToken: String {
        "accessToken"
    }
    
    static var assignee: String {
        "assignee"
    }
    
    static var userName: String {
        "userName"
    }
    
    static var userID: String {
        "userID"
    }
    
    static var shortCode: String {
        "FKRC"
    }
    
    static var careHomeID: String {
        "2"
    }
    
    static var signInURL: String {
        "auth/login"
    }
    
    static var taskURL: String {
        "tasks/FKRC/careHome/2"
    }
}
