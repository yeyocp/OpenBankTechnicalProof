//
//  CharactersListInteractor.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 21/1/22.
//

import Foundation

final class CharactersListInteractor: CharactersListInteractorInterface {
    
    // MARK: - Properties -
    
    weak var presenter: CharactersListOutputInteractorInterface?
    var charactersManagementService: CharactersManagementService
    
    let pendingOperations = PendingOperations()
    
    // MARK: - Initialization -
    
    init() {
        charactersManagementService = CharactersManagementService()
    }
    
    // MARK: - Internal Methods -
    
    func fetchCharactersList() {
        charactersManagementService.getCharacters(success: { charactersList in
            self.presenter?.onCharactersListSucceed(charactersListDomain: charactersList)
        }) { _, _ in
            self.presenter?.onCharactersListFailed()
        }
    }
    
    func fetchCharacterImage(url: URL?, indexPath: IndexPath) {
        guard pendingOperations.downloadInProgress[indexPath] == nil else {
            return
        }
        
        let downloader = ImageDownloader(url)
        
        downloader.completionBlock = { [weak self] in
            if downloader.isCancelled {
                return
            }
            
            switch downloader.result {
            case .success(let data):
                self?.presenter?.onCharacterImageSucceed(imageData: data, indexPath: indexPath)
            case .failure:
                self?.presenter?.onCharacterImageFailed(indexPath: indexPath)
            }
            
            self?.pendingOperations.downloadInProgress.removeValue(forKey: indexPath)
        }
        
        pendingOperations.downloadInProgress[indexPath] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
    }
}
