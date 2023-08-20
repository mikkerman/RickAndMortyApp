//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Михаил Герман on 19.08.2023.
//

import Foundation

/// Object that represent a singlet API Call
final class RMRequest  {
    /// API constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desire endpoint
    private let endpoints: RMEndpoint
    
    /// Path components for API, if any
    private let pathComponents: [String]
    /// Query arguments for API, if any
    private let queryParameters: [URLQueryItem]
    
    /// Constructed URL for the Api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoints.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach ({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        return string
    }
    
    
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    /// Construct request
    /// - Parameters:
    ///   - endpoints: Target endpoint
    ///   - pathComponents: Collection of Path components
    ///   - queryParameters: Collection of query parametrs
    public init(endpoints: RMEndpoint,
                pathComponents: [String] = [],
                queryParameters: [URLQueryItem] = []
    ) {
        self.endpoints = endpoints
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    convenience init?(url: URL) {
        let string = url.absoluteString
        if !string.contains(Constants.baseUrl) {
            return nil
        }
        
        let trimmed = string.replacingOccurrences(of: Constants.baseUrl+"/", with: "")
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endpointString = components[0]
                if let rmEndpoints = RMEndpoint(rawValue: endpointString) {
                    self.init(endpoints: rmEndpoints)
                    return
                }
            }
            
        } else if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count >= 2 {
                let endpointString = components[0]
                let queryItemString = components[1]
                let queryItems: [URLQueryItem] = queryItemString.components(separatedBy: "&").compactMap({
                    guard $0.contains("=") else {
                        return nil
                    }
                    let parts = $0.components(separatedBy: "=")
                    
                    
                    return URLQueryItem(
                        name: parts[0],
                        value: parts[1])
                })
                if let rmEndpoints = RMEndpoint(rawValue: endpointString) {
                    self.init(endpoints: rmEndpoints, queryParameters: queryItems)
                    return
                }
            }
        }
        return nil
    }
}

extension RMRequest {
    static let listCharactersRequest = RMRequest(endpoints: .character)
}
