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
        errorTitle.text = LocalizableConstants.errorTitle.localized()
        errorDescriptionTextView.text = LocalizableConstants.errorDescription.localized()
        errorButton.setTitle(LocalizableConstants.errorButton.localized(), for: .normal)
        errorButton.isUppercaseTitle = false
    }
}

// MARK: - Private methods -

extension GeneralErrorView {
    
    private func setupView() {
        self.view.backgroundColor = .white
        errorButton.setTitleColor(.white, for: .normal)
        errorButton.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.2274509804, blue: 0.6784313725, alpha: 1)
        errorButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        errorButton.titleLabel?.numberOfLines = 1
        errorButton.titleLabel?.adjustsFontSizeToFitWidth = true
        errorButton.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        errorTitle.font = .systemFont(ofSize: 16, weight: .medium)
        errorTitle.textColor = #colorLiteral(red: 0.1568627451, green: 0.2274509804, blue: 0.6784313725, alpha: 1)
        errorDescriptionTextView.font = .systemFont(ofSize: 14, weight: .regular)
        errorDescriptionTextView.textColor = #colorLiteral(red: 0.1882352941, green: 0.1843137255, blue: 0.1843137255, alpha: 1)
    }
}
