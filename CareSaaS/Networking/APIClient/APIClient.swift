//
//  APIClient.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Combine
import Foundation

final class APIClient: APIService {
    
    // MARK: - Protocol Conformance
    
    func signIn(email: String, password: String) -> AnyPublisher<LoginResponse, APIError> {
        request(.login(email: email, password: password))
    }
    
    func getAllTasks() -> AnyPublisher<[Tasks], APIError> {
        request(.tasks)
    }
}

// MARK: - Private Methods

private extension APIClient {
    
    private func request<T: Decodable>(_ endpoint: ApiEndpoint) -> AnyPublisher<T, APIError> {
        do {
            let keychainService = KeychainService()
            let accessToken = keychainService.accessToken
            let request = try endpoint.request(accessToken: accessToken)
            
            return URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { data, response -> T in
                    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                        throw APIError.failedRequest
                    }
                    
                    guard (200..<300).contains(statusCode) else {
                        if statusCode == 401 {
                            throw APIError.unauthorized
                        } else {
                            throw APIError.failedRequest
                        }
                    }
                    
                    // Print the raw JSON response for debugging
                    if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                        print("JSON Response: \(json)")
                    } else {
                        print("Failed to serialize JSON")
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        return try JSONDecoder().decode(T.self, from: data)
                    } catch {
                        print("Unable to Decode Response \(error)")
                        throw APIError.invalidResponse
                    }
                }
                .mapError { error -> APIError in
                    switch error {
                    case let apiError as APIError:
                        return apiError
                    case URLError.notConnectedToInternet:
                        return APIError.unreachable
                    default:
                        return APIError.failedRequest
                    }
                }
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        } catch {
            if let apiError = error as? APIError {
                return Fail(error: apiError)
                    .eraseToAnyPublisher()
            } else {
                return Fail(error: APIError.unknown)
                    .eraseToAnyPublisher()
            }
        }
    }
}
