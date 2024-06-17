//
//  URLRequest+Extentions.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

extension URLRequest {
    
    mutating func addHeader(_ headers: Headers) {
        headers.forEach { header, value in
            addValue(value, forHTTPHeaderField: header)
        }
    }
}
