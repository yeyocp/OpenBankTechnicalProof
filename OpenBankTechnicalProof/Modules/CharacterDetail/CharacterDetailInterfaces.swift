//
//  CharacterDetailInterfaces.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import Foundation

protocol CharacterDetailRouterInterface: RouterInterface {}

protocol CharacterDetailViewInterface: ViewInterface {
    var presenter: CharacterDetailViewDelegateInterface? { get set }
    var characterDetail: CharacterDetailViewModel? { get }
    
    func didCharacterDetailFinish(_ characterDetailViewModel: CharacterDetailViewModel?)
}

protocol CharacterDetailViewDelegateInterface: PresenterInterface {
    var router: CharacterDetailRouterInterface { get }
    var view: CharacterDetailViewInterface { get }
    var interactor: CharacterDetailInteractorInterface? { get }
        
    func fetchCharacterDetail(id: Int)
}

protocol CharacterDetailInteractorInterface: InputInteractorInterface {
    var presenter: CharacterDetailOutputInteractorInterface? { get set }
    var charactersManagementService: CharactersManagementService { get }
    
    func fetchCharacterDetail(id: Int)
}

protocol CharacterDetailOutputInteractorInterface: OutputInteractorInterface {
    func onCharacterDetailSucceed(characterDetailDomain: CharacterItemDomainModel)
    func onCharacterDetailFailed()
}
