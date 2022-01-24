//
//  CharacterDetailInteractor.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import Foundation

final class CharacterDetailInteractor: CharacterDetailInteractorInterface {
    
    // MARK: - Properties -
    
    weak var presenter: CharacterDetailOutputInteractorInterface?
    var charactersManagementService: CharactersManagementService
    
    // MARK: - Initialization -
    
    init() {
        charactersManagementService = CharactersManagementService()
    }
    
    // MARK: - Internal Methods -
    
    func fetchCharacterDetail(id: Int) {
        charactersManagementService.getCharacterDetail(id: id, success: { character in
            self.presenter?.onCharacterDetailSucceed(characterDetailDomain: character)
        }) { _, _ in
            self.presenter?.onCharacterDetailFailed()
        }
    }
    
    
}
