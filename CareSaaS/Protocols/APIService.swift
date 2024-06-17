//
//  APIService.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Combine
import Foundation

protocol APIService {
    
    // MARK: - Properties
    
    func signIn(userName: String, password: String) -> AnyPublisher<LoginResponse, APIError>
    
    func getAllTasks(assignee: String) -> AnyPublisher<[Tasks], APIError>
}
