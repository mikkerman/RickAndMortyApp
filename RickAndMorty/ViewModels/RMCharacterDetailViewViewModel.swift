//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Михаил Герман on 20.08.2023.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
