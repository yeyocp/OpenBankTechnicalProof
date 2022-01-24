//
//  CharactersManagementService.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import Foundation

final class CharactersManagementService {
    
    var networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkAPIClient.shared()) {
        self.networkManager = networkManager
    }
    
    func getCharacters(success: @escaping ([CharacterItemDomainModel]) -> Void,
                       failure: @escaping FailureCompletion) {
        
        let hash: String = "thesoer\(ServiceConstants.marvelPrivateKey)\(ServiceConstants.marvelPublicKey)".md5
        let url = String(format: ServiceConstants.charactersListPath,
                         ServiceConstants.timestampParameter,
                         ServiceConstants.marvelPublicKey,
                         hash)
        let getCharactersListFormat = "\(ServiceConstants.baseURL)\(url)"
        let networkBuilder = NetworkManagerBuilder(urlString: getCharactersListFormat,
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
}
