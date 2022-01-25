//
//  LoaderViewController.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import UIKit

class LoaderViewController: UIViewController {
    
    // MARK: - IBOutlets -
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupViews()
        self.activityIndicator.startAnimating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.activityIndicator.stopAnimating()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.layoutIfNeeded()
    }
    
    // MARK: - Private Methods -
    
    private func setupViews() {
        self.loadingLabel.text = CommonConstants.loading
        self.loadingLabel.textColor = ColorsConstants.loadingLabelColor
    }
    
    // MARK: - Public Methods -
    
    func show(over: UIViewController) {
        
        DispatchQueue.main.async {
            self.providesPresentationContextTransitionStyle = true
            self.definesPresentationContext = true
            self.modalPresentationStyle = .overFullScreen
            self.modalTransitionStyle = .crossDissolve
            self.view.layoutIfNeeded()
            self.view.backgroundColor = ColorsConstants.loaderBackgroundColor
            
            self.activityIndicator.style = .large
            
            over.present(self, animated: true, completion: nil)
        }
    }
    
    func hide(completion: (() -> Void)? = nil) {
        
        DispatchQueue.main.async {
            self.dismiss(animated: true) {
                completion?()
            }
        }
    }
}
