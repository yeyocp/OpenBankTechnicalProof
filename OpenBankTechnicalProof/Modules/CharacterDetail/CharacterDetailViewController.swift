//
//  CharacterDetailViewController.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import UIKit

class CharacterDetailViewController: BaseViewController {

    // MARK: - IBOutlets -
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
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
        
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        descriptionLabel.textColor = #colorLiteral(red: 0.5843137255, green: 0.5843137255, blue: 0.6039215686, alpha: 1)
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    private func setupView() {
        nameLabel.text = self.characterDetail?.name
        descriptionLabel.text = self.characterDetail?.description
    }
}

// MARK: - View Interface -

extension CharacterDetailViewController: CharacterDetailViewInterface {
    
    func didCharacterDetailFinish(_ characterDetailViewModel: CharacterDetailViewModel?) {
        self.characterDetail = characterDetailViewModel
        self.setupView()
    }
}
