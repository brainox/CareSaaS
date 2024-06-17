//
//  ApiEndpoint.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

enum ApiEndpoint {
    // MARK: - Cases
    
    case login
    case tasks
    
    // MARK: - Properties
    
    var request: URLRequest {
        var request = URLRequest(url: url)
        request.addHeader(headers)
        request.httpMethod = httpMethod.rawValue
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
    
    private var headers: Headers {
        [
            "Content-Type": "application/json",
            "Authorization": Environment.accessToken
        ]
    }
    
    private var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .tasks:
            return .get
        }
    }
}
