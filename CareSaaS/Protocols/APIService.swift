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
    
    func signIn(email: String, password: String) -> AnyPublisher<LoginResponse, APIError>
    
    func getAllTasks() -> AnyPublisher<[Tasks], APIError>
}
