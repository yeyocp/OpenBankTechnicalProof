//
//  CharactersListMockedInterface.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof

class CharactersListMockedInterface: CharactersListViewInterface {
    
    // MARK: - Variables -
    
    var presenter: CharactersListViewDelegateInterface?
    var charactersList: [CharactersListItemViewModel?]?
    var shouldDidCharactersListFinish: Bool = false
    
    // MARK: - Methods -
    
    func didCharactersFinish(_ charactersViewModel: [CharactersListItemViewModel?]) {
        shouldDidCharactersListFinish = true
        charactersList = charactersViewModel
    }
    
    func showLoader() {}
    
    func hideLoader(completion: (() -> Void)?) {}
}
