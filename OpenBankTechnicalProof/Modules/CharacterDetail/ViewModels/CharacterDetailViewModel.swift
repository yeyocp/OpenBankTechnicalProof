//
//  CharacterDetailViewModel.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import Foundation

struct CharacterDetailViewModel {
    var id: Int
    var name: String
    var description: String
    var imageURL: String
    var imageExtension: String
    
    // MARK: - Init -
    
    init(characterItemDomainModel: CharacterItemDomainModel) {
        self.id = characterItemDomainModel.id
        self.name = characterItemDomainModel.name
        self.description = characterItemDomainModel.description
        self.imageURL = characterItemDomainModel.thumbnail.imageURL
        self.imageExtension = characterItemDomainModel.thumbnail.imageExtension
    }
}

final class CharacterDetailViewModelParser {
    
    // MARK: - Parser -
    
    static func parse(_ character: CharacterItemDomainModel) -> CharacterDetailViewModel {
        let characterViewModel = CharacterDetailViewModel.init(characterItemDomainModel: character)
        
        return characterViewModel
    }
}
