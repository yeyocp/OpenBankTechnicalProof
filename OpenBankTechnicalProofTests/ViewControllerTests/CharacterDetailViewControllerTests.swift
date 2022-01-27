//
//  CharacterDetailViewControllerTests.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof
import XCTest

class CharacterDetailViewControllerTests: XCTestCase {
    
    // MARK: - Properties -
    
    var viewController = CharacterDetailViewController()
    var router: CharacterDetailRouterInterface = CharacterDetailRouter()
    var presenter: CharacterDetailPresenterMock?
    
    // MARK: - SetUp -

    override func setUpWithError() throws {
        makeCharacterDetailViewController()
    }

    // MARK: - TearDown -
    
    override func tearDownWithError() throws {
        presenter = nil
    }
    
    // MARK: - ViewController Tests -
    
    func testPreferredStatusBarStyle() {
        XCTAssertEqual(viewController.preferredStatusBarStyle, .lightContent)
    }
    
    func testFetchCharacterDetail() {
        viewController.viewDidLoad()
        
        XCTAssertEqual(presenter?.fetchCharacterDetailCalled, true)
    }
}

extension CharacterDetailViewControllerTests {
    
    // MARK: - Private Methods -
    
    private func makeCharacterDetailViewController() {
        let vc = CharacterDetailViewController(nibName: "CharacterDetailViewController", bundle: nil)
        
        presenter = CharacterDetailPresenterMock(router: router, view: vc)
        vc.presenter = presenter
        self.viewController = vc
        viewController.loadView()
    }
}
