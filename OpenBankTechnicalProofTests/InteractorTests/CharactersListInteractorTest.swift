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
        loadCharactersDataWithSuccess()
        
        charactersListInteractorOutput.testExpectation = expectation(description: "onCharactersListSucceed expectation")
        subject?.fetchCharactersList()
        waitForExpectations(timeout: 1, handler: nil)
        
        XCTAssertNotNil(charactersListInteractorOutput.characters)
    }
    
    func testGetCharactersListError() {
        loadCharactersDataWithError()
        
        charactersListInteractorOutput.testExpectation = expectation(description: "onCharactersListFailed expectation")
        subject?.fetchCharactersList()
        waitForExpectations(timeout: 1, handler: nil)
        
        XCTAssertNil(charactersListInteractorOutput.characters)
    }
}

extension CharactersListInteractorTest {
    
    // MARK: - Private Methods -
    
    private func loadCharactersDataWithSuccess () {
        subject?.charactersManagementService = CharactersManagementService.init(networkManager: NetworkAPIClientMock.init("CharactersList"))
    }
    
    private func loadCharactersDataWithError() {
        subject?.charactersManagementService = CharactersManagementService.init(networkManager: NetworkAPIClientMock.init("WrongNetworkManager"))
    }
}
