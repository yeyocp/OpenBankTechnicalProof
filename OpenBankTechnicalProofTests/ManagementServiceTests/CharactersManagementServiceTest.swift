//
//  CharactersManagementServiceTest.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof
import XCTest

class CharactersManagementServiceTest: XCTestCase {
    
    // MARK: - Variables -
    
    var id: Int = 1
    
    // MARK: - SetUp -
    
    override func setUpWithError() throws {}
    
    // MARK: - TearDown -
    
    override func tearDownWithError() throws {}
    
    // MARK: - Tests: GetCharactersList -
    
    func testGetGetCharactersListSuccess() throws {
        let charactersManagementService = getCharactersManagementService(from: "CharactersList")
        
        charactersManagementService.getCharacters(success: { characters in
            XCTAssertNotNil(characters)
        }, failure: { _, _ in
            XCTAssertThrowsError("App should get successfully the characters list")
        })
    }
    
    func testGetGetCharactersListError() throws {
        let charactersManagementService = getCharactersManagementService(from: "WrongNetworkManager")
        
        charactersManagementService.getCharacters(success: { characters in
            XCTAssertNil(characters)
        }, failure: { error, _ in
            XCTAssertNotNil(error)
        })
    }
}

extension CharactersManagementServiceTest {
    
    // MARK: - Private Methods -
    
    func getCharactersManagementService(from jsonFile: String) -> CharactersManagementService {
        let networkManager = NetworkAPIClientMock(jsonFile)
        let charactersManagementServiceTest = CharactersManagementService(networkManager: networkManager)
        
        return charactersManagementServiceTest
    }
}
