//
//  CharactersListInteractorTest.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 25/1/22.
//

@testable import OpenBankTechnicalProof
import XCTest

class CharactersListInteractorTest: XCTestCase {
    var subject: CharactersListInteractor?
    var charactersListService = CharactersManagementService.init(networkManager: NetworkAPIClientMock.init("CharactersList"))
    let charactersListInteractorOutput = FakeCharactersListInteractorOutput()
    
    override func setUpWithError() throws {
        subject = CharactersListInteractor()
        subject?.charactersManagementService = charactersListService
        subject?.presenter = charactersListInteractorOutput
    }
    
    // MARK: - Characters -
    
    func testGetCharactersListSuccess() {
        loadCharacterDataWithSuccess()
        
        charactersListInteractorOutput.testExpectation = expectation(description: "onCharactersListSucceed expectation")
        subject?.fetchCharactersList()
        waitForExpectations(timeout: 1, handler: nil)
        
        XCTAssertNotNil(charactersListInteractorOutput.characters)
    }
    
    func testGetCharactersListError() {
        loadCharacterDataWithError()
        
        charactersListInteractorOutput.testExpectation = expectation(description: "onCharactersListFailed expectation")
        subject?.fetchCharactersList()
        waitForExpectations(timeout: 1, handler: nil)
        
        XCTAssertNil(charactersListInteractorOutput.characters)
    }
}

extension CharactersListInteractorTest {
    
    // MARK: - Private Methods -
    
    private func loadCharacterDataWithSuccess () {
        subject?.charactersManagementService = CharactersManagementService.init(networkManager: NetworkAPIClientMock.init("CharactersList"))
    }
    
    private func loadCharacterDataWithError() {
        subject?.charactersManagementService = CharactersManagementService.init(networkManager: NetworkAPIClientMock.init("WrongNetworkManager"))
    }
}
