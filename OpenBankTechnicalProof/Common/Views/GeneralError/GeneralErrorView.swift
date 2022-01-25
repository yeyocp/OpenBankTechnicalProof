//
//  GeneralErrorView.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 20/1/22.
//

import UIKit

class GeneralErrorView: UIViewController {
    
    // MARK: - IBOutlets -
    
    @IBOutlet private weak var errorImage: UIImageView!
    @IBOutlet private weak var errorTitle: UILabel!
    @IBOutlet private weak var errorDescriptionTextView: UITextView!
    @IBOutlet private weak var errorButton: UIButton!
    
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
        errorTitle.text = LocalizableConstants.errorTitle.localized()
        errorDescriptionTextView.text = LocalizableConstants.errorDescription.localized()
        errorButton.setTitle(LocalizableConstants.errorButton.localized(), for: .normal)
    }
}

// MARK: - Private methods -

extension GeneralErrorView {
    
    private func setupView() {
        self.view.backgroundColor = ColorsConstants.errorBackgroundColor
        errorImage.image = UIImage(systemName: "xmark.octagon")?.withTintColor(ColorsConstants.mainColor, renderingMode: .alwaysOriginal)
        errorButton.setTitleColor(.white, for: .normal)
        errorButton.backgroundColor = ColorsConstants.mainColor
        errorButton.titleLabel?.font = FontsConstants.systemBold16
        errorButton.titleLabel?.numberOfLines = 1
        errorButton.titleLabel?.adjustsFontSizeToFitWidth = true
        errorButton.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        errorTitle.font = FontsConstants.systemMedium16
        errorTitle.textColor = ColorsConstants.mainColor
        errorDescriptionTextView.font = FontsConstants.systemRegular14
        errorDescriptionTextView.textColor = ColorsConstants.errorDescriptionColor
    }
}
