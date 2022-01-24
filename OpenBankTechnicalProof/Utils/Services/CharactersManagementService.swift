//
//  CharactersManagementService.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import Foundation

final class CharactersManagementService {
    
    // MARK: - Properties -
    
    var networkManager: NetworkManagerProtocol
    
    // MARK: - Init -
    
    init(networkManager: NetworkManagerProtocol = NetworkAPIClient.shared()) {
        self.networkManager = networkManager
    }
    
    // MARK: - Internal Methods -
    
    func getCharacters(success: @escaping ([CharacterItemDomainModel]) -> Void,
                       failure: @escaping FailureCompletion) {
        
        let parameters = String(format: ServiceConstants.charactersListPath,
                                ServiceConstants.timestampParameter,
                                ServiceConstants.marvelPublicKey,
                                ServiceConstants.hash)
        let url = "\(ServiceConstants.baseURL)\(parameters)"
        let networkBuilder = NetworkManagerBuilder(urlString: url,
                                                   httpMethod: .GET,
                                                   parameters: nil )
        
        networkManager.execute(serviceRequest: networkBuilder) { (result: Result<CharactersDomainModelResponse>) in
            switch result {
            case .success(let charactersDomainModelResponse):
                success(charactersDomainModelResponse.data.characters)
            case .failure(let error, let statusCode):
                failure(error, self.networkManager.handleAPIErrors(statusCode: statusCode))
            }
        }
    }
    
    func getCharacterDetail(id: Int,
                            success: @escaping (CharacterItemDomainModel) -> Void,
                            failure: @escaping FailureCompletion) {
        
        let parameters = String(format: ServiceConstants.characterDetailPath,
                                ServiceConstants.timestampParameter,
                                ServiceConstants.marvelPublicKey,
                                ServiceConstants.hash)
        let url = "\(ServiceConstants.baseURL)\(parameters)"
        let networkBuilder = NetworkManagerBuilder(urlString: url,
                                                   httpMethod: .GET,
                                                   parameters: nil )
        
        networkManager.execute(serviceRequest: networkBuilder) { (result: Result<CharactersDomainModelResponse>) in
            switch result {
            case .success(let charactersDomainModelResponse):
                if !charactersDomainModelResponse.data.characters.isEmpty {
                    success(charactersDomainModelResponse.data.characters[0])
                }
            case .failure(let error, let statusCode):
                failure(error, self.networkManager.handleAPIErrors(statusCode: statusCode))
            }
        }
    }
}
