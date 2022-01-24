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
}
