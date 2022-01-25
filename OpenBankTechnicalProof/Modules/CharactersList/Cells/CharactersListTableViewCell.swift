//
//  CharactersListTableViewCell.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import UIKit

class CharactersListTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets -
    
    @IBOutlet private weak var characterImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Properties -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - ReuseIdentifier -
    
    static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: Bundle(for: self))
    }
    
    static var  reuseIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: - Public Methods -
    
    func configure(_ character: CharactersListItemViewModel) {
        self.initViews()
        self.loadCharacterData(character)
    }
    
    // MARK: - Private Methods -
    
    private func initViews() {
        self.nameLabel.textColor = ColorsConstants.labelMainColor
        self.nameLabel.font = FontsConstants.systemBold16
    }
    
    private func loadCharacterData(_ character: CharactersListItemViewModel) {
        if let imageURL = URL(string: "\(character.imageURL).\(character.imageExtension)") {
            characterImage.load(url: imageURL)
        }
        self.nameLabel.text = character.name
        
    }
}
