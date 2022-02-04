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
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerNib()
        self.initViews()
        
        self.presenter?.fetchCharactersList(showLoader: true)
    }
    
    // MARK: - Private Methods -
    
    private func initViews() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.charactersTableView.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }
    
    @objc private func refreshData(_ sender: Any) {
        presenter?.fetchCharactersList(showLoader: false)
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
            dataSource?.presenter = self.presenter
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
        self.refreshControl.endRefreshing()
    }
    
    func didCharacterImageDownloaded(data: Data, indexPath: IndexPath) {
        if let character = self.charactersList?[indexPath.row] {
            character.image = UIImage(data: data)
            character.imageState = .downloaded
            self.dataSource?.tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
    
    func didCharacterImageFailed(indexPath: IndexPath) {
        if let character = self.charactersList?[indexPath.row] {
            character.image = UIImage(named: "Failed")
            character.imageState = .failed
            self.dataSource?.tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
}

extension CharactersListViewController: CharactersListDataSourceDelegate {
    
    func didSelectCharacter(_ character: CharactersListItemViewModel) {
        presenter?.navigateToCharacterDetail(character)
    }
}
