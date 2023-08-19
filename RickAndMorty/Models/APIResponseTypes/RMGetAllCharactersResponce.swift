//
//  RMGetAllCharactersResponce.swift
//  RickAndMorty
//
//  Created by Михаил Герман on 19.08.2023.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [RMCharacter]
}
