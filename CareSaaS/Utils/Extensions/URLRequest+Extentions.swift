//
//  URLRequest+Extentions.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

extension URLRequest {
    
    mutating func addHeaders(_ headers: Headers) {
        headers.forEach { header, value in
            addValue(value, forHTTPHeaderField: header)
        }
    }
    
    mutating func addQueryParameters(_ parameters: [String: String]) {
        guard let url = self.url else { return }
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            var queryItems = urlComponents.queryItems ?? []
            for (key, value) in parameters {
                queryItems.append(URLQueryItem(name: key, value: value))
            }
            urlComponents.queryItems = queryItems
            self.url = urlComponents.url
        }
    }
}
