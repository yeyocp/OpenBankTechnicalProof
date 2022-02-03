//
//  CharactersListItemViewModel.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 21/1/22.
//

import UIKit

class CharactersListItemViewModel {
    let id: Int
    let name: String
    let url: URL?
    var image = UIImage(named: "Placeholder")
    var state = PhotoRecordState.new
//    var imageURL: String
//    var imageExtension: String
    
    // MARK: - Init -
    
    init(characterItemDomainModel: CharacterItemDomainModel) {
        self.id = characterItemDomainModel.id
        self.name = characterItemDomainModel.name
        self.url = URL(string: "\(characterItemDomainModel.thumbnail.imageURL).\(characterItemDomainModel.thumbnail.imageExtension)")
//        self.imageURL = characterItemDomainModel.thumbnail.imageURL
//        self.imageExtension = characterItemDomainModel.thumbnail.imageExtension
    }
}

final class CharactersListItemViewModelParser {
    
    // MARK: - Parser -
    
    static func parse(_ characters: [CharacterItemDomainModel]) -> [CharactersListItemViewModel] {
        let charactersViewModel = characters.map { CharactersListItemViewModel.init(characterItemDomainModel: $0) }
        
        return charactersViewModel
    }
}
