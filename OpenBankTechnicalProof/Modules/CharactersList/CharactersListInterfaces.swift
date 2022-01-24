//
//  CharactersListInterfaces.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 21/1/22.
//

import Foundation

protocol CharactersListRouterInterface: RouterInterface {
    func navigateToCharacterDetail(character: CharactersListItemViewModel)
}

protocol CharactersListViewInterface: ViewInterface {
    var presenter: CharactersListViewDelegateInterface? { get set }
    var marvelCharactersList: [CharactersListItemViewModel?] { get }
    
    func didCharactersFinish(_ charactersViewModel: [CharactersListItemViewModel?])
    
    func loadCharactersList(charactersList: [CharactersListItemViewModel?])
}

protocol CharactersListViewDelegateInterface: PresenterInterface {
    var router: CharactersListRouterInterface { get }
    var view: CharactersListViewInterface { get }
    var interactor: CharactersListInteractorInterface? { get }
    
    func navigateToCharacterDetail(vm: CharactersListItemViewModel)
    
    func fetchCharactersList()
}

protocol CharactersListInteractorInterface: InputInteractorInterface {
    var presenter: CharactersListOutputInteractorInterface? { get set }
    var charactersManagementService: CharactersManagementService { get }
    
    func fetchCharactersList()
}

protocol CharactersListOutputInteractorInterface: OutputInteractorInterface {
    func onCharactersListSucceed(charactersListVM: [CharactersListItemViewModel?])
    func onCharactersListFailed()
}
