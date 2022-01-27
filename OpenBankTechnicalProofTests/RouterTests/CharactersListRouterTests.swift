//
//  CharactersListRouterTests.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof
import XCTest

class CharactersListRouterTests: XCTestCase {
    
    // MARK: - Variables -
    
    var navigationController: UINavigationController?
    var charactersListRouter: CharactersListRouter?
    
    // MARK: - SetUp -
    
    override func setUpWithError() throws {
        navigationController = UINavigationController()
        charactersListRouter = CharactersListRouter(navigationController: navigationController)
    }
    
    // MARK: - TearDown -
    
    override func tearDownWithError() throws {
        navigationController = nil
        charactersListRouter = nil
    }
    
    // MARK: - InstantiateViewController -
    
    func testInstantiateViewController() {
        let viewController = charactersListRouter?.instantiateViewController(nil as String?)
        
        XCTAssertTrue(viewController is CharactersListViewController)
    }
    
    // MARK: - Navigations -
    
    func testnavigateToCharacterDetail() {
        charactersListRouter?.navigateToCharacterDetail(CharactersListItemViewModel(characterItemDomainModel: CharacterItemDomainModel(id: 1, name: "", description: "", thumbnail: CharacterItemThumbnail(imageURL: "", imageExtension: ""))))
        XCTAssertTrue(charactersListRouter?.navigationController?.topViewController is CharacterDetailViewController)
    }
}
