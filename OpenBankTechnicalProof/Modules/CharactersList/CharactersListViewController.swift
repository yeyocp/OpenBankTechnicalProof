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
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initViews()
        self.presenter?.fetchCharactersList()
    }
    
    // MARK: - Private Methods -
    
    private func initViews() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

extension CharactersListViewController: CharactersListViewInterface {
    
    func didCharactersFinish(_ charactersViewModel: [CharactersListItemViewModel?]) {
        self.charactersList = charactersViewModel
        self.charactersTableView.reloadData()
    }
}

extension CharactersListViewController: CharactersListDataSourceDelegate {
    
    func didSelectCharacter(_ character: CharactersListItemViewModel) {
        presenter?.navigateToCharacterDetail(character)
    }
}
