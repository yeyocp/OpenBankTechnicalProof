//
//  CharactersListTableViewController.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import UIKit

protocol ProjectListTableViewControllerDelegate: AnyObject {
    func didSelectCharacter(_ character: CharactersListItemViewModel)
}

final class CharactersListTableViewController: UITableViewController {
    
    // MARK: - Properties -
    
    var dataSource: CharactersListDataSource?
    weak var delegate: ProjectListTableViewControllerDelegate?
    
    // MARK: - Init -
    
    init(characters: [CharactersListItemViewModel]) {
        super.init(nibName: nil, bundle: nil)
        
        registerCells()
        setupViews()
        setupDataSource(characters: characters)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been inplementd")
    }
}

// MARK: - Private Methods -

extension CharactersListTableViewController {
    
    private func setupViews() {
        registerCells()
        
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorStyle = .none
    }
    
    private func setupDataSource(characters: [CharactersListItemViewModel]) {
        
        self.dataSource = CharactersListDataSource.init(tableView: self.tableView, characters: characters)
        self.dataSource?.delegate = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.delegate = dataSource
        self.tableView.dataSource = dataSource
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .clear
    }
    
    private func registerCells() {
        tableView.register(CharactersListTableViewCell.nib, forCellReuseIdentifier: CharactersListTableViewCell.reuseIdentifier)
    }
}

// MARK: - Data Source Delegate -

extension CharactersListTableViewController: CharactersListDataSourceDelegate {
    
    func didSelectCharacter(_ character: CharactersListItemViewModel) {
        delegate?.didSelectCharacter(character)
    }
}
