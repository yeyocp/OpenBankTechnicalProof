//
//  CharacterDetailInteractorTest.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof
import XCTest

class CharacterDetailInteractorTest: XCTestCase {
    
    var subject: CharacterDetailInteractor?
    var characterDetailService = CharactersManagementService.init(networkManager: NetworkAPIClientMock.init("CharacterDetail"))
    let characterDetailInteractorOutput = FakeCharacterDetailInteractorOutput()
    
    override func setUpWithError() throws {
        subject = CharacterDetailInteractor()
        subject?.charactersManagementService = characterDetailService
        subject?.presenter = characterDetailInteractorOutput
    }
    
    // MARK: - Character Detail -
    
    func testGetCharacterDetailSuccess() {
        loadCharacterDataWithSuccess()
        
        characterDetailInteractorOutput.testExpectation = expectation(description: "onCharacterDetailSucceed expectation")
        subject?.fetchCharacterDetail(id: 1)
        waitForExpectations(timeout: 1, handler: nil)
        
        XCTAssertNotNil(characterDetailInteractorOutput.character)
    }
    
    func testGetCharacterDetailError() {
        loadCharacterDataWithError()
        
        characterDetailInteractorOutput.testExpectation = expectation(description: "onCharacterDetailFailed expectation")
        subject?.fetchCharacterDetail(id: 1)
        waitForExpectations(timeout: 1, handler: nil)
        
        XCTAssertNil(characterDetailInteractorOutput.character)
    }
}

extension CharacterDetailInteractorTest {
    
    // MARK: - Private Methods -
    
    private func loadCharacterDataWithSuccess () {
        subject?.charactersManagementService = CharactersManagementService.init(networkManager: NetworkAPIClientMock.init("CharacterDetail"))
    }
    
    private func loadCharacterDataWithError() {
        subject?.charactersManagementService = CharactersManagementService.init(networkManager: NetworkAPIClientMock.init("WrongNetworkManager"))
    }
}
