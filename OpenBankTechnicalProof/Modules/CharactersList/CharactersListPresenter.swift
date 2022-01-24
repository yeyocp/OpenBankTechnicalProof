//
//  CharactersListPresenter.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 21/1/22.
//

import UIKit

final class CharactersListPresenter: CharactersListViewDelegateInterface {
    
    // MARK: - Private Properties -
    
    var router: CharactersListRouterInterface
    unowned var view: CharactersListViewInterface
    var interactor: CharactersListInteractorInterface?
    
    var charactersListViewModel: [CharactersListItemViewModel]?
    
    // MARK: - Lifecycle -
    
    // MARK: - Lifecycle -
    
    init(router: CharactersListRouterInterface, view: CharactersListViewInterface, interactor: CharactersListInteractorInterface? = nil) {
        self.router = router
        self.view = view
        self.interactor = interactor
    }
}

extension CharactersListPresenter {
    
    // MARK: - Internal Methods
    
    func fetchCharactersList() {
        self.view.showLoader()
        self.interactor?.fetchCharactersList()
    }
    
    func navigateToCharacterDetail(_ character: CharactersListItemViewModel) {
        self.router.navigateToCharacterDetail(character)
    }
}

extension CharactersListPresenter: CharactersListOutputInteractorInterface {
    
    func onCharactersListSucceed(charactersListDomain: [CharacterItemDomainModel]) {
        let charactersListVM = CharactersListItemViewModelParser.parse(charactersListDomain)
        
        self.view.hideLoader()
        self.view.didCharactersFinish(charactersListVM)
    }
    
    func onCharactersListFailed() {
        self.view.hideLoader()
        self.router.showGeneralErrorScreen(shouldReturn: true)
    }
}
