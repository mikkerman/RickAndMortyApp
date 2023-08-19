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
    ///     - Type: The type of object we expected to get back 
    ///     - completion: Callback with data or error
    public func execute<T: Codable> (
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping(Result<String, Error>) -> Void
    ) {
        
    }
}
