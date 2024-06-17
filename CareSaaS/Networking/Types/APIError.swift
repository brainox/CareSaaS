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
    case unreachable
 
    var errorDescription: String? {
        switch self {
        case .unreachable:
            return "You need a network connection"
        case .unknown, .failedRequest, .invalidResponse:
            return "The list could not be fetched"
        }
    }
}
