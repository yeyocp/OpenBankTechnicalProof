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
    
    init(router: CharactersListRouterInterface, view: CharactersListViewInterface, interactor: CharactersListInteractorInterface? = nil) {
        self.router = router
        self.view = view
        self.interactor = interactor
    }
}

extension CharactersListPresenter {
    
    // MARK: - Internal Methods
    
    func fetchCharactersList(showLoader: Bool) {
        if showLoader {
            self.view.showLoader()
        }
        self.interactor?.fetchCharactersList()
    }
    
    func fetchCharacterImage(url: URL?, indexPath: IndexPath) {
        self.interactor?.fetchCharacterImage(url: url, indexPath: indexPath)
    }
    
    func navigateToCharacterDetail(_ character: CharactersListItemViewModel) {
        self.router.navigateToCharacterDetail(character)
    }
}

extension CharactersListPresenter: CharactersListOutputInteractorInterface {
    
    func onCharactersListSucceed(charactersListDomain: [CharacterItemDomainModel]) {
        let charactersListVM = CharactersListItemViewModelParser.parse(charactersListDomain)
        
        DispatchQueue.main.async {
            self.view.hideLoader {
                self.view.didCharactersFinish(charactersListVM)
            }
        }
    }
    
    func onCharactersListFailed() {
        DispatchQueue.main.async {
            self.view.hideLoader {
                self.router.showGeneralErrorScreen(shouldReturn: true)
            }
        }
    }
    
    func onCharacterImageSucceed(imageData: Data, indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.view.didCharacterImageDownloaded(data: imageData, indexPath: indexPath)
        }
    }
    
    func onCharacterImageFailed(indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.view.didCharacterImageFailed(indexPath: indexPath)
        }
    }
}
