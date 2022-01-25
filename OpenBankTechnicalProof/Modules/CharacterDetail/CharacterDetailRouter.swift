//
//  CharacterDetailRouter.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import Foundation
import UIKit

final class CharacterDetailRouter: CharacterDetailRouterInterface {
    
    // MARK: - Properties -
    
    weak var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    var characterId: Int?
    var title = CharacterDetailConstants.characterDetail
    
    // MARK: - View Controller -
    
    func instantiateViewController<T>(_ context: T) -> UIViewController {
        let vc = CharacterDetailViewController(nibName: characterDetailViewController, bundle: nil)
        let interactor = CharacterDetailInteractor()
        let presenter = CharacterDetailPresenter(router: self, view: vc, interactor: interactor)
        
        if let characterId = self.characterId {
            vc.characterId = characterId
        }
        
        vc.configure(navigationTitle: title)
        vc.presenter = presenter
        interactor.presenter = presenter
        self.viewController = vc
        
        return vc
    }
}

extension CharacterDetailRouter {}

