//
//  CharacterDetailMockedInterface.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof

class CharacterDetailMockedInterface: CharacterDetailViewInterface {
    
    // MARK: - Variables -
    
    var presenter: CharacterDetailViewDelegateInterface?
    var characterDetail: CharacterDetailViewModel?
    var didCharacterDetailFinish: Bool = false
    var error: APIErrorType?
    
    // MARK: - Methods -
    
    func didCharacterDetailFinish(_ characterDetailViewModel: CharacterDetailViewModel?) {
        didCharacterDetailFinish = true
        characterDetail = characterDetailViewModel
    }
    
    func showLoader() {}
    
    func hideLoader(completion: (() -> Void)?) {}
}
