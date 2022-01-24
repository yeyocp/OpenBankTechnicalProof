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

        // Do any additional setup after loading the view.
    }
}

extension CharactersListViewController: CharactersListViewInterface {
    
    func didCharactersFinish(_ charactersViewModel: [CharactersListItemViewModel?]) {
        // TODO: Implement
    }
    
    func loadCharactersList(charactersList: [CharactersListItemViewModel?]) {
        // TODO: Implement
    }
}
