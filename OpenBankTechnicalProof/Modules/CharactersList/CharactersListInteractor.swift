//
//  CharactersListInteractor.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 21/1/22.
//

import Foundation

final class CharactersListInteractor: CharactersListInteractorInterface {
    
    // MARK: - Properties -
    
    weak var presenter: CharactersListOutputInteractorInterface?
    var charactersManagementService: CharactersManagementService
    
    // MARK: - Initialization -
    
    init() {
        charactersManagementService = CharactersManagementService()
    }
    
    // MARK: - Internal Methods -
    
    func fetchCharactersList() {
        charactersManagementService.getMarvelCharacters(success: { charactersList in
            self.presenter?.onCharactersListSucceed(charactersListDomain: charactersList)
        }, failure: { _, _ in
            self.presenter?.onCharactersListFailed()
        })
    }
    
    
}
