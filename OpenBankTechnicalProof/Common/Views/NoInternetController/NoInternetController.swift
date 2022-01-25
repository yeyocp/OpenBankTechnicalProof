//
//  NoInternetController.swift
//  knowler
//
//  Created by Ingrid Guerrero on 5/17/19.
//  Copyright © 2019 Everis. All rights reserved.
//

import UIKit

class NoInternetController: BaseViewController {
    
    @IBOutlet private weak var alertView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private struct Constants {
        static let noInternetTitleLocalized = "alert.no.internet.title".localized()
    }

    private func setupViews() {
        
        alertView.backgroundColor = ColorsConstants.noInternetBackgroundColor
        titleLabel.text = Constants.noInternetTitleLocalized
        titleLabel.textColor = ColorsConstants.noInternetTextColor
        titleLabel.font = FontsConstants.systemRegular14
    }
}
