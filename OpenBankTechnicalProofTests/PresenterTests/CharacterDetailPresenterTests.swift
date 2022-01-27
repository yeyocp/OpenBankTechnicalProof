//
//  CharacterDetailPresenterTests.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof
import XCTest

class CharacterDetailPresenterTests: XCTestCase {
    
    // MARK: - Variables -
    
    var presenter: CharacterDetailPresenter?
    let mockInteractor = CharacterDetailMockedInteractor()
    let mockRouter = CharacterDetailMockedRouter()
    var mockInterface = CharacterDetailMockedInterface()
    
    // MARK: - SetUp -
    
    override func setUpWithError() throws {
        presenter = CharacterDetailPresenter.init(router: mockRouter, view: mockInterface, interactor: mockInteractor)
    }
    
    // MARK: - TearDown -
    
    override func tearDownWithError() throws {}
    
    // MARK: - Fetch Test -
    
    func testFetchCharacterDetail() {
        presenter?.fetchCharacterDetail(id: 1)
        XCTAssertTrue(mockInteractor.interactorShouldFetchCharacterDetail)
    }
}
