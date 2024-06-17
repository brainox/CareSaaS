//
//  HTTPClient.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Foundation

/**
 A protocol defining the contract for an HTTP client.
 
 An HTTP client is responsible for making HTTP requests asynchronously and providing the result via a completion closure.
 
 Implement this protocol to create custom HTTP client functionality within your application.
 
 */
public protocol HTTPClient {
    
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    func get(from url: URL, completion: @escaping (Result) -> Void)
}

