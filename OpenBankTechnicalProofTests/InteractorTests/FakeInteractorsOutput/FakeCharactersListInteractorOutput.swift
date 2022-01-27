//
//  FakeCharactersListInteractorOutput.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 25/1/22.
//

@testable import OpenBankTechnicalProof
import XCTest

class FakeCharactersListInteractorOutput: CharactersListOutputInteractorInterface {
    
    var characters: [CharacterItemDomainModel]?
    var error: APIErrorType?
    var testExpectation: XCTestExpectation?
    
    func onCharactersListSucceed(charactersListDomain: [CharacterItemDomainModel]) {
        self.characters = charactersListDomain
        testExpectation?.fulfill()
    }
    
    func onCharactersListFailed() {
        self.error = APIErrorType.generalServiceError
        testExpectation?.fulfill()
    }
}
