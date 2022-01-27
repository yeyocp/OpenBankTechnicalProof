//
//  BaseMockedRouter.swift
//  OpenBankTechnicalProofTests
//
//  Created by Sergio Castaño Panchuelo on 27/1/22.
//

@testable import OpenBankTechnicalProof
import UIKit

class BaseMockedRouter: RouterInterface {
    
    // MARK: - Variables -
    
    var navigationController: UINavigationController?
    var viewController: UIViewController?
    
    // MARK: - Initializer -
    
    required init() {}
    
    func instantiateViewController<T>(_ context: T?) -> UIViewController {
        if let viewController = viewController {
            return viewController
        }
        
        return UIViewController()
    }
}
