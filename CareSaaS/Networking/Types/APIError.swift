//
//  APIError.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

enum APIError: Error, LocalizedError {
    case unknown
    case failedRequest
    case invalidResponse
    case unauthorized
    case unreachable
 
    var errorDescription: String? {
        switch self {
        case .unreachable:
            return "You need a network connection"
        case .unknown, .failedRequest, .invalidResponse:
            return "Oops! An error occured."
        case .unauthorized:
            return "You are unauthorized to access this data"
        }
    }
}
