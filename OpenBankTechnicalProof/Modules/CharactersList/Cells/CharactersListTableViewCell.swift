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
        initViews()
        loadCharacterData(character)
    }
    
    // MARK: - Private Methods -
    
    private func initViews() {
        nameLabel.textColor = #colorLiteral(red: 0.1882352941, green: 0.1843137255, blue: 0.1843137255, alpha: 1)
        nameLabel.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    private func loadCharacterData(_ character: CharactersListItemViewModel) {
        nameLabel.text = character.name
    }
}
