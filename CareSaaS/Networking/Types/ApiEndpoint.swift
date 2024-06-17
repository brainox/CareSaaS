//
//  ApiEndpoint.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

enum ApiEndpoint {
    // MARK: - Cases
    
    case login(userName: String, password: String)
    case tasks(queryParams: [String: String])
    
    // MARK: - Properties
    
    func request(accessToken: String?) throws -> URLRequest {
        var request = URLRequest(url: url)
        
        request.addHeaders(headers)
        request.httpMethod = httpMethod.rawValue
        
        if requiresAuthorization {
            if let accessToken = accessToken {
                request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            } else {
                throw APIError.unauthorized
            }
        }
        
        if let queryParams = queryParameters {
            request.addQueryParameters(queryParams)
        }
        
        if case let .login(userName: userName, password: password) = self {
            let parameters: [String: String] = ["userName": userName, "password": password]
            request.httpBody = try JSONEncoder().encode(parameters)
        }
        
        return request
    }
    
}

// MARK: - Private Methods

private extension ApiEndpoint {
    
    private var url: URL {
        Environment.baseURL.appending(path: path)
    }
    
    private var path: String {
        switch self {
        case .login:
            return Environment.signInURL
        case .tasks:
            return Environment.taskURL
        }
    }
    
    private var requiresAuthorization: Bool {
        switch self {
        case .login:
            false
        case .tasks:
            true
        }
    }
    
    private var headers: Headers {
        [
            "Content-Type": "application/json",
        ]
    }
    
    private var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .POST
        case .tasks:
            return .GET
        }
    }
    
    private var queryParameters: [String: String]? {
        switch self {
        case .tasks(let queryParams):
            return queryParams
        default:
            return nil
        }
    }
}
