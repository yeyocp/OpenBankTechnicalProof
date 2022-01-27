//
//  CharactersListMockedRouter.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof

class CharactersListMockedRouter: BaseMockedRouter, CharactersListRouterInterface {
    
    // MARK: - Variables -
    
    var charactersList: [CharactersListItemViewModel]?
    var shouldNavigateToCharacterDetail: Bool = false
    
    // MARK: - Methods -
    
    func navigateToCharacterDetail(_ character: CharactersListItemViewModel) {
        shouldNavigateToCharacterDetail = true
    }
}
