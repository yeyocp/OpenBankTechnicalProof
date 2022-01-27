//
//  CharactersListPresenterTests.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof
import XCTest

class CharactersListPresenterTests: XCTestCase {
    
    // MARK: - Variables -

    var presenter: CharactersListPresenter?
    let mockInteractor = CharactersListMockedInteractor()
    let mockRouter = CharactersListMockedRouter()
    var mockInterface = CharactersListMockedInterface()
    
    // MARK: - SetUp -
    
    override func setUpWithError() throws {
        presenter = CharactersListPresenter.init(router: mockRouter, view: mockInterface, interactor: mockInteractor)
    }
    
    // MARK: - TearDown -
    
    override func tearDownWithError() throws {}
    
    // MARK: - Fetch Test -
    
    func testFetchCharactersList() {
        presenter?.fetchCharactersList(showLoader: false)
        XCTAssertTrue(self.mockInteractor.shouldFetchCharactersList)
    }
}
