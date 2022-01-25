//
//  UINavigationController+Extensions.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 21/1/22.
//

import UIKit

extension UINavigationController {
    
    func setStyle() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.2274509804, blue: 0.6784313725, alpha: 1)
        appearance.shadowColor = .black
        appearance.titleTextAttributes = textAttributes
        self.navigationBar.standardAppearance = appearance;
        self.navigationBar.scrollEdgeAppearance = self.navigationBar.standardAppearance
        
        self.navigationBar.layoutIfNeeded()
    }
}
