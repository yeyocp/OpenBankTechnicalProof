//
//  FakeCharacterDetailInteractorOutput.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof
import XCTest

class FakeCharacterDetailInteractorOutput: CharacterDetailOutputInteractorInterface {
    
    var character: CharacterItemDomainModel?
    var error: APIErrorType?
    var testExpectation: XCTestExpectation?
    
    func onCharacterDetailSucceed(characterDetailDomain: CharacterItemDomainModel) {
        self.character = characterDetailDomain
        testExpectation?.fulfill()
    }
    
    func onCharacterDetailFailed() {
        self.error = APIErrorType.generalServiceError
        testExpectation?.fulfill()
    }
}
