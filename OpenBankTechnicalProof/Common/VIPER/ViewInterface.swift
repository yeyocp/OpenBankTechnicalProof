//
//  ViewInterface.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 20/1/22.
//

import Foundation
import UIKit

// MARK: - Base View Interface -

protocol ViewInterface: AnyObject, BaseViewControllerInterface {
    func showLoader()
    func hideLoader(completion: (() -> Void)?)
}

// MARK: - Base View Interface Default Implementation -

extension ViewInterface {}
