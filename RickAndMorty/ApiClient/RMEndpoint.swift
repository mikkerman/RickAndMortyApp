//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Михаил Герман on 19.08.2023.
//

import Foundation

/// Represents uique API endpoint
@frozen enum RMEndpoint: String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
