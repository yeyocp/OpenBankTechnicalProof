//
//  UINavigationItem+Extensions.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import UIKit

extension UINavigationItem {
    
    func setTitle(title: String, navigationTitleHeight: CGFloat = 35) {
        
        let titleLabel = UILabel()
        
        titleLabel.text = title
        titleLabel.font = FontsConstants.systemBold18
        titleLabel.sizeToFit()
        titleLabel.textColor = ColorsConstants.navigationTextColor
        
        // If in the future it is necessary add more items, add them to the Stack View
        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        stackView.alignment = .center
        
        let width = titleLabel.frame.size.width
        
        stackView.frame = CGRect(x: 0, y: 0, width: width, height: navigationTitleHeight)
        
        titleLabel.sizeToFit()
        
        self.titleView = stackView
    }
}
