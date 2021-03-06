//
//  CharactersListRouter.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import Foundation
import UIKit

final class CharactersListRouter: CharactersListRouterInterface {
    
    // MARK: - Properties -
    
    weak var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    var charactersList: [CharactersListItemViewModel?]?
    var title = CharactersListConstants.characters
    
    // MARK: - View Controller -
    
    func instantiateViewController<T>(_ context: T) -> UIViewController {
        let vc = CharactersListViewController(nibName: charactersListViewController, bundle: nil)
        let interactor = CharactersListInteractor()
        let presenter = CharactersListPresenter(router: self, view: vc, interactor: interactor)
        
        vc.configure(navigationTitle: title)
        vc.presenter = presenter
        interactor.presenter = presenter
        self.viewController = vc
        
        return vc
    }
}

extension CharactersListRouter {
    
    func navigateToCharacterDetail(_ character: CharactersListItemViewModel) {
        let characterDetailRouter = CharacterDetailRouter()
        
        characterDetailRouter.navigationController = navigationController
        characterDetailRouter.characterId = character.id
        characterDetailRouter.pushOnNavigationController()
    }
}
