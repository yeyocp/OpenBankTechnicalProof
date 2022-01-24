//
//  CharacterDetailViewController.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import UIKit

class CharacterDetailViewController: BaseViewController {

    // MARK: - IBOutlets -
    
    // MARK: - Properties -
    
    var presenter: CharacterDetailViewDelegateInterface?
    var characterDetail: CharacterDetailViewModel?
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initViews()
    }
    
    // MARK: - Private Methods -
    
    private func initViews() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

// MARK: - View Interface -

extension CharacterDetailViewController: CharacterDetailViewInterface {
    
    func didCharacterDetailFinish(_ characterDetailViewModel: CharacterDetailViewModel?) {
        self.characterDetail = characterDetailViewModel
        
        // TODO: Fill in data
    }
}
