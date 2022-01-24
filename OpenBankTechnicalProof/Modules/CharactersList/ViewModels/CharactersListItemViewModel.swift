//
//  CharactersListItemViewModel.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 21/1/22.
//

import Foundation

struct CharactersListItemViewModel {
    var id: Int
    var name: String
    var imageURL: String
    var imageExtension: String
    
    // MARK: - Init -
    
    init(characterItemDomainModel: CharacterItemDomainModel) {
        self.id = characterItemDomainModel.id
        self.name = characterItemDomainModel.name
        self.imageURL = characterItemDomainModel.thumbnail.imageURL
        self.imageExtension = characterItemDomainModel.thumbnail.imageExtension
    }
}

final class CharactersListItemViewModelParser {
    
    // MARK: - Parser -
    
    static func parse(_ characters: [CharacterItemDomainModel]) -> [CharactersListItemViewModel] {
        let charactersViewModel = characters.map { CharactersListItemViewModel.init(characterItemDomainModel: $0) }
        
        return charactersViewModel
    }
}
