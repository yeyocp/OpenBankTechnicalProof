//
//  CharactersListViewController.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import UIKit

class CharactersListViewController: BaseViewController {
    
    // MARK: - IBOutlets -
    
    @IBOutlet private weak var charactersTableView: UITableView!
    
    // MARK: - Properties -
    
    var presenter: CharactersListViewDelegateInterface?
    var charactersList: [CharactersListItemViewModel?]?
    var dataSource: CharactersListDataSource?
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerNib()
        self.initViews()
        
        self.presenter?.fetchCharactersList()
    }
    
    // MARK: - Private Methods -
    
    private func initViews() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

// MARK: - Data Source -

extension CharactersListViewController {
    
    private func registerNib() {
        charactersTableView.register(CharactersListTableViewCell.nib,
                                     forCellReuseIdentifier: CharactersListTableViewCell.reuseIdentifier)
    }
    
    private func setupDataSource() {
        if let charactersList = self.charactersList {
            dataSource = CharactersListDataSource(tableView: self.charactersTableView, characters: charactersList)
            dataSource?.delegate = self
            charactersTableView.delegate = dataSource
            charactersTableView.dataSource = dataSource
            charactersTableView.reloadData()
        }
    }
}

// MARK: - View Interface -

extension CharactersListViewController: CharactersListViewInterface {
    
    func didCharactersFinish(_ charactersViewModel: [CharactersListItemViewModel?]) {
        self.charactersList = charactersViewModel
        
        if self.dataSource == nil {
            setupDataSource()
        }
        
        self.charactersTableView.reloadData()
    }
}

extension CharactersListViewController: CharactersListDataSourceDelegate {
    
    func didSelectCharacter(_ character: CharactersListItemViewModel) {
        presenter?.navigateToCharacterDetail(character)
    }
}
