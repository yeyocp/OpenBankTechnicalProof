//
//  UINavigationController+Extensions.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 21/1/22.
//

import UIKit

extension UINavigationController {
    
    func setStyle(isTransparent: Bool) {
        let textAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
        
        self.navigationBar.titleTextAttributes = textAttributes
        self.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationBar.barTintColor = isTransparent ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.1568627451, green: 0.2274509804, blue: 0.6784313725, alpha: 1)

        let clearImage = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).imageRepresentation
        let removeBorderImage = isTransparent ? clearImage : nil
        
        self.navigationBar.setBackgroundImage(removeBorderImage, for: .default)
        self.navigationBar.shadowImage = removeBorderImage
        self.navigationBar.layoutIfNeeded()
    }
}
