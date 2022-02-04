//
//  CharactersListInterfaces.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 21/1/22.
//

import Foundation

protocol CharactersListRouterInterface: RouterInterface {
    func navigateToCharacterDetail(_ character: CharactersListItemViewModel)
}

protocol CharactersListViewInterface: ViewInterface {
    var presenter: CharactersListViewDelegateInterface? { get set }
    var charactersList: [CharactersListItemViewModel?]? { get }
    
    func didCharactersFinish(_ charactersViewModel: [CharactersListItemViewModel?])
    func didCharacterImageDownloaded(data: Data, indexPath: IndexPath)
    func didCharacterImageFailed(indexPath: IndexPath)
}

protocol CharactersListViewDelegateInterface: PresenterInterface {
    var router: CharactersListRouterInterface { get }
    var view: CharactersListViewInterface { get }
    var interactor: CharactersListInteractorInterface? { get }
    
    func navigateToCharacterDetail(_ character: CharactersListItemViewModel)
    
    func fetchCharactersList(showLoader: Bool)
    func fetchCharacterImage(url: URL?, indexPath: IndexPath)
}

protocol CharactersListInteractorInterface: InputInteractorInterface {
    var presenter: CharactersListOutputInteractorInterface? { get set }
    var charactersManagementService: CharactersManagementService { get }
    
    func fetchCharactersList()
    func fetchCharacterImage(url: URL?, indexPath: IndexPath)
}

protocol CharactersListOutputInteractorInterface: OutputInteractorInterface {
    func onCharactersListSucceed(charactersListDomain: [CharacterItemDomainModel])
    func onCharactersListFailed()
    
    func onCharacterImageSucceed(imageData: Data, indexPath: IndexPath)
    func onCharacterImageFailed(indexPath: IndexPath)
}
