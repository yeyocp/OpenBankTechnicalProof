//
//  CharactersListDataSource.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import UIKit

protocol CharactersListDataSourceDelegate: AnyObject {
    func didSelectCharacter(_ character: CharactersListItemViewModel)
}

final class CharactersListDataSource: NSObject {
    
    // MARK: - Properties -
    
    private(set) var tableView: UITableView
    var presenter: CharactersListViewDelegateInterface?
    var characters: [CharactersListItemViewModel?] = []
    weak var delegate: CharactersListDataSourceDelegate?
    
    // MARK: - Init -
    
    init(tableView: UITableView, characters: [CharactersListItemViewModel?]) {
        self.tableView = tableView
        self.characters = characters
        self.tableView.reloadData()
        
        super.init()
    }
}

// MARK: - UITableViewDataSource -

extension CharactersListDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var tableViewCell = UITableViewCell()

        if let cell = tableView.dequeueReusableCell(withIdentifier: CharactersListTableViewCell.reuseIdentifier,
                                                    for: indexPath) as? CharactersListTableViewCell,
            let character = characters[indexPath.row] {
            
            cell.selectionStyle = .none
            cell.configure(character)
            tableViewCell = cell
        }
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDelegate -

extension CharactersListDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let character = self.characters[indexPath.row] {
            delegate?.didSelectCharacter(character)
        }
    }
}
