//
//  CharacterDetailPresenterMock.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof

class CharacterDetailPresenterMock: CharacterDetailViewDelegateInterface {
    
    // MARK: - Variables -
    
    var router: CharacterDetailRouterInterface
    var view: CharacterDetailViewInterface
    var interactor: CharacterDetailInteractorInterface?
    
    var characterDetailViewModel: CharacterDetailViewModel? = CharacterDetailViewModel.init(characterItemDomainModel: CharacterItemDomainModel(id: 1, name: "", description: "", thumbnail: CharacterItemThumbnail(imageURL: "", imageExtension: "")))
    
    // MARK: - Variables for testing -
    
    var fetchCharacterDetailCalled: Bool = false
    
    // MARK: - Initiaization -
    
    init(router: CharacterDetailRouterInterface,
         view: CharacterDetailViewInterface,
         interactor: CharacterDetailInteractorInterface? = nil) {
        self.router = router
        self.view = view
        self.interactor = interactor
    }
    
    // MARK: - Internal Methods -
    
    func fetchCharacterDetail(id: Int) {
        fetchCharacterDetailCalled = true
        view.didCharacterDetailFinish(characterDetailViewModel)
    }
}
