//
//  CharacterDetailMockedInteractor.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof

class CharacterDetailMockedInteractor: CharacterDetailInteractorInterface {
    
    // MARK: - Variables -
    
    var presenter: CharacterDetailOutputInteractorInterface?
    var charactersManagementService = CharactersManagementService()
    
    var interactorShouldFetchCharacterDetail: Bool = false
    
    // MARK: - Methods -
    
    func fetchCharacterDetail(id: Int) {
        interactorShouldFetchCharacterDetail = true
    }
}
