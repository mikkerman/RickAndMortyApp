//
//  RMService.swift
//  RickAndMorty
//
//  Created by Михаил Герман on 19.08.2023.
//

import Foundation

/// Primary Api service object to get Rick and Morty data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///     - Request: Request instance
    ///     - completion: Callback with data or error
    public func executr(_ request: RMRequest, completion: @escaping() -> Void) {
        
    }
}
