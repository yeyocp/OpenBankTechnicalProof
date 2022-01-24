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
        interactor?.fetchCharactersList()
    }
    
    func navigateToCharacterDetail(vm: CharactersListItemViewModel) {
        router.navigateToCharacterDetail(character: vm)
    }
}

extension CharactersListPresenter: CharactersListOutputInteractorInterface {
    
    func onCharactersListSucceed(charactersListVM: [CharactersListItemViewModel?]) {
        view.loadCharactersList(charactersList: charactersListVM)
    }
    
    func onCharactersListFailed() {
        router.showGeneralErrorScreen(shouldReturn: true)
    }
}
