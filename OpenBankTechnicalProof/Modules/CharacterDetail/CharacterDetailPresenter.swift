//
//  CharacterDetailPresenter.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import UIKit

final class CharacterDetailPresenter: CharacterDetailViewDelegateInterface {
    
    // MARK: - Private Properties -
    
    var router: CharacterDetailRouterInterface
    unowned var view: CharacterDetailViewInterface
    var interactor: CharacterDetailInteractorInterface?
    
    var characterDetailViewModel: CharacterDetailViewModel?
    
    // MARK: - Lifecycle -
    
    init(router: CharacterDetailRouterInterface, view: CharacterDetailViewInterface, interactor: CharacterDetailInteractorInterface? = nil) {
        self.router = router
        self.view = view
        self.interactor = interactor
    }
}

extension CharacterDetailPresenter {
    
    // MARK: - Internal Methods
    
    func fetchCharacterDetail(id: Int) {
        self.view.showLoader()
        self.interactor?.fetchCharacterDetail(id: id)
    }
}

extension CharacterDetailPresenter: CharacterDetailOutputInteractorInterface {
    
    func onCharacterDetailSucceed(characterDetailDomain: CharacterItemDomainModel) {
        let characterDetailVM = CharacterDetailViewModelParser.parse(characterDetailDomain)
        
        DispatchQueue.main.async {
            self.view.hideLoader()
            self.view.didCharacterDetailFinish(characterDetailVM)
        }
    }
    
    func onCharacterDetailFailed() {
        DispatchQueue.main.async {
            self.view.hideLoader()
            self.router.showGeneralErrorScreen(shouldReturn: true)
        }
    }
}

