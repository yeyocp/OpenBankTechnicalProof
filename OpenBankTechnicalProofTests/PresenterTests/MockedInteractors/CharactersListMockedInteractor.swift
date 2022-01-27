//
//  CharactersListMockedInteractor.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof

class CharactersListMockedInteractor: CharactersListInteractorInterface {
    
    // MARK: - Variables -
    
    var presenter: CharactersListOutputInteractorInterface?
    var charactersManagementService = CharactersManagementService()
    var shouldFetchCharactersList: Bool = false
    
    // MARK: - Methods -
    
    func fetchCharactersList() {
        shouldFetchCharactersList = true
    }
}
