//
//  CharacterDetailViewController.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import UIKit

class CharacterDetailViewController: BaseViewController {

    // MARK: - IBOutlets -
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Properties -
    
    var presenter: CharacterDetailViewDelegateInterface?
    var characterDetail: CharacterDetailViewModel?
    var characterId: Int = 0
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initViews()
        self.presenter?.fetchCharacterDetail(id: characterId)
    }
    
    // MARK: - Private Methods -
    
    private func initViews() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        nameLabel.textColor = ColorsConstants.labelMainColor
        nameLabel.font = FontsConstants.systemBold20
        nameLabel.textAlignment = .center
        descriptionLabel.textColor = ColorsConstants.labelSecondaryColor
        descriptionLabel.font = FontsConstants.systemRegular16
    }
    
    private func setupView() {
        if let characterDetail = self.characterDetail,
            let imageURL = URL(string: "\(characterDetail.imageURL).\(characterDetail.imageExtension)") {
            characterImage.load(url: imageURL)
        }
        
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
