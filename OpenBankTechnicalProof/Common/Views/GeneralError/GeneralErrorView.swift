//
//  GeneralErrorView.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 20/1/22.
//

import UIKit
import MaterialComponents

class GeneralErrorView: UIViewController {
    
    // MARK: - IBOutlets -
    
    @IBOutlet private weak var errorImage: UIImageView!
    @IBOutlet private weak var errorTitle: UILabel!
    @IBOutlet private weak var errorDescriptionTextView: UITextView!
    @IBOutlet private weak var errorButton: MDCFloatingButton!
    
    // MARK: - Properties -
    
    var shouldReturn: Bool = true
    weak var generalErrorButtonDelegate: GeneralErrorViewButtonDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
        self.localizableString()
    }

    // MARK: - IBActions -
    
    @IBAction func closeErrorScreen(_ sender: Any) {
        generalErrorButtonDelegate?.manageGeneralErrorViewButtonTapped(shouldReturn: self.shouldReturn)
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Localizable -

extension GeneralErrorView: LocalizableProtocol {
    
    private struct LocalizableConstants {
        static let errorTitle = "alert.general.error.title"
        static let errorDescription = "alert.general.error.message"
        static let errorButton = "alert.general.error.button"
    }
    
    func localizableString() {
        errorTitle.text = LocalizableConstants.errorTitle.localizable()
        errorDescriptionTextView.text = LocalizableConstants.errorDescription.localizable()
        errorButton.setTitle(LocalizableConstants.errorButton.localizable(), for: .normal)
        errorButton.isUppercaseTitle = false
    }
}

// MARK: - Private methods -

extension GeneralErrorView {
    
    private func setupView() {
        self.view.backgroundColor = ThemeDemo.ErrorStyles.backgroundColor
        errorButton.setTitleColor(ThemeDemo.GeneralButton.textColor, for: .normal)
        errorButton.backgroundColor = ThemeDemo.GeneralButton.backgroundColor
        errorButton.titleLabel?.font = ThemeDemo.GeneralButton.textFont
        errorButton.titleLabel?.numberOfLines = 1
        errorButton.titleLabel?.adjustsFontSizeToFitWidth = true
        errorButton.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        errorButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        errorTitle.font = ThemeDemo.ErrorStyles.titleFont
        errorTitle.textColor = ThemeDemo.ErrorStyles.titleColor
        errorDescriptionTextView.font = ThemeDemo.ErrorStyles.textFont
        errorDescriptionTextView.textColor = ThemeDemo.ErrorStyles.textColor
    }
}
