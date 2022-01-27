//
//  CharactersListViewControllerTests.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof
import XCTest

class CharactersListViewControllerTests: XCTestCase {
    
    // MARK: - Properties -
    
    var viewController = CharactersListViewController()
    var router: CharactersListRouterInterface = CharactersListRouter()
    var presenter: CharactersListPresenterMock?
    
    // MARK: - SetUp -

    override func setUpWithError() throws {
        makeCharactersListViewController()
    }

    // MARK: - TearDown -
    
    override func tearDownWithError() throws {
        presenter = nil
    }
    
    // MARK: - ViewController Tests -
    
    func testPreferredStatusBarStyle() {
        XCTAssertEqual(viewController.preferredStatusBarStyle, .lightContent)
    }
    
    func testFetchCharactersList() {
        viewController.viewDidLoad()
        
        XCTAssertEqual(presenter?.fetchCharactersListCalled, true)
    }
}

extension CharactersListViewControllerTests {
    
    // MARK: - Private Methods -
    
    private func makeCharactersListViewController() {
        let vc = CharactersListViewController(nibName: "CharactersListViewController", bundle: nil)
        
        presenter = CharactersListPresenterMock(router: router, view: vc)
        vc.presenter = presenter
        self.viewController = vc
        viewController.loadView()
    }
}
