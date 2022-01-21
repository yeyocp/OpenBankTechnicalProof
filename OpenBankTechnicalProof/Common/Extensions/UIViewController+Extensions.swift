//
//  UIViewController+Extensions.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 21/1/22.
//

import UIKit

extension UIViewController {
    
    // MARK: - Internet Connection -
    
    func showNoInternetScreen() {
        let noInternetController = NoInternetController(nibName: Constants.noInternetControllerName, bundle: nil)
        noInternetController.view.backgroundColor = .clear
        noInternetController.modalPresentationStyle = .overFullScreen
        self.navigationController?.present(noInternetController, animated: false, completion: nil)
    }
    
    func hideNoInternetScreen() {
        if let noInternetController = self as? NoInternetController {
            noInternetController.dismiss(animated: false, completion: nil)
        }
    }
}
