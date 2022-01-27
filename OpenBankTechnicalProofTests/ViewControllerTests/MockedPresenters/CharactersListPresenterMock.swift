//
//  CharactersListPresenterMock.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof

class CharactersListPresenterMock: CharactersListViewDelegateInterface {
    
    // MARK: - Variables -
    
    var router: CharactersListRouterInterface
    var view: CharactersListViewInterface
    var interactor: CharactersListInteractorInterface?
    
    var charactersListViewModel: [CharactersListItemViewModel] = []
    
    // MARK: - Variables for testing -
    
    var fetchCharactersListCalled: Bool = false
    var didPressCharacterDetailCalled: Bool = false
    
    // MARK: - Initiaization -
    
    init(router: CharactersListRouterInterface,
         view: CharactersListViewInterface,
         interactor: CharactersListInteractorInterface? = nil) {
        self.router = router
        self.view = view
        self.interactor = interactor
    }
    
    // MARK: - Internal Methods -
    
    func fetchCharactersList(showLoader: Bool) {
        fetchCharactersListCalled = true
        view.didCharactersFinish([CharactersListItemViewModel?]())
    }
    
    func navigateToCharacterDetail(_ character: CharactersListItemViewModel) {
        didPressCharacterDetailCalled = true
    }
}
