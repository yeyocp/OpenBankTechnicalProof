//
//  CharacterDetailRouterTests.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof
import XCTest

class CharacterDetailRouterTests: XCTestCase {
    
    // MARK: - Variables -
    
    var navigationController: UINavigationController?
    var characterDetailRouter: CharacterDetailRouter?
    
    // MARK: - SetUp -
    
    override func setUpWithError() throws {
        navigationController = UINavigationController()
        characterDetailRouter = CharacterDetailRouter(navigationController: navigationController)
    }
    
    // MARK: - TearDown -
    
    override func tearDownWithError() throws {
        navigationController = nil
        characterDetailRouter = nil
    }
    
    // MARK: - InstantiateViewController -
    
    func testInstantiateViewController() {
        let viewController = characterDetailRouter?.instantiateViewController(nil as String?)
        
        XCTAssertTrue(viewController is CharacterDetailViewController)
    }
    
    // MARK: - Navigations -
}

