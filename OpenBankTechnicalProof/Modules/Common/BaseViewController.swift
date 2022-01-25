//
//  BaseViewController.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 21/1/22.
//

import UIKit
import Reachability

class BaseViewController: UIViewController, BaseViewControllerInterface {
    
    // MARK: - Constants -
    
    private struct Constants {
        static let navigationBackString = "navigation.general.back"
    }
    
    // MARK: - Properties -
    
    var navigationTitle = ""
    var reachability: Reachability?
    var loader: LoaderViewController?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationTitle()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: Constants.navigationBackString.localized(),
                                                                style: .plain,
                                                                target: nil,
                                                                action: nil)
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setStyle()
        self.navigationController?.navigationBar.isTranslucent = false
        self.edgesForExtendedLayout = []
        
        configureReachability()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        reachability?.stopNotifier()
        reachability = nil
    }
}

extension BaseViewController {
    
    // MARK: - Navigation Title -
    
    func configure(navigationTitle: String) {
        self.navigationTitle = navigationTitle
    }
    
    private func setupNavigationTitle() {
        if !navigationTitle.isEmpty {
            navigationItem.setTitle(title: navigationTitle)
        }
    }
}

extension BaseViewController {
    
    // MARK: - Reachability  -
    
    private func configureReachability() {
        
        reachability = try! Reachability()

        reachability?.whenReachable = { reachability in
            print("reachable")
            self.hideNoInternetScreen()
        }
        reachability?.whenUnreachable = { _ in
             print("unreachable")
             self.showNoInternetScreen()
        }

        do {
            try self.reachability?.startNotifier()
        } catch {
            print("Unable to start the network notifier")
        }
    }
}

extension BaseViewController {
    
    // MARK: - Loader  -
    
    func showLoader() {
        
        DispatchQueue.main.async {
            if self.loader == nil {
                self.loader = LoaderViewController(nibName: "LoaderViewController", bundle: nil)
            }
            
            self.loader?.show(over: self)
        }
    }
    
    func hideLoader(completion: (() -> Void)? = nil) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if let loader = self.loader {
                loader.hide {
                    completion?()
                }
            } else {
                completion?()
            }
        }
    }
}
