//
//  RouterInterface.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 20/1/22.
//

import Foundation
import UIKit

// MARK: - Base Wireframe Interface -

protocol RouterInterface: GeneralErrorViewButtonDelegate {
    
    // MARK: - REQUIRED -
    
    var navigationController: UINavigationController? { get set }
    var viewController: UIViewController? { get set }
    
    init()
    
    func instantiateViewController<T>(_ context: T?) -> UIViewController
}

protocol GeneralErrorViewButtonDelegate: AnyObject {
    func manageGeneralErrorViewButtonTapped(shouldReturn: Bool)
}

// MARK: - Base Wireframe Interface Default Implementation -

extension RouterInterface {
    
    // MARK: - CONVENIENCE INIT -
    
    init(navigationController: UINavigationController? = nil) {
        self.init()
        self.navigationController = navigationController
    }
    
    // MARK: - PUSH -
    
    func pushOnNavigationController() {
        navigationController?.pushViewController(instantiateViewController(nil as String?), animated: true)
    }
    
    func pushOnNavigationController<T>(_ context: T?) {
        navigationController?.pushViewController(instantiateViewController(context), animated: true)
    }
    
    // MARK: - POP -
    
    func popFromNavigationController() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func showGeneralErrorScreen(shouldReturn: Bool = true) {
        if let fromVC = viewController {
            let vc = GeneralErrorView(nibName: "GeneralErrorView", bundle: nil)
            
            vc.generalErrorButtonDelegate = self
            vc.modalPresentationStyle = .fullScreen
            vc.shouldReturn = shouldReturn
            fromVC.present(vc, animated: false, completion: nil)
        }
    }
    
    // MARK: - PRESENT -
    
    func presentFromViewControllerModally(_ viewController: UIViewController) {
        let vc = instantiateViewController(nil as String?)
        
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        vc.view.frame = viewController.view.frame
        viewController.present(vc, animated: true, completion: nil)
    }
    
    func presentFromViewController<T>(_ viewController: UIViewController, context: T) {
        viewController.present(instantiateViewController(context), animated: true, completion: nil)
    }
    
    // MARK: - DISMISS -
    
    func dismissViewController() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - MANAGE ERRORVIEW BUTTON TAPPED, DEFAULT POP VC, OVERRIDE TU CUSTOMIZE ACTION -
    
    func manageGeneralErrorViewButtonTapped(shouldReturn: Bool) {
        if shouldReturn {
            popFromNavigationController()
        }
    }
}
