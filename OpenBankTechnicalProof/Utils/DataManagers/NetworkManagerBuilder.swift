//
//  NetworkManagerBuilder.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import Foundation

struct NetworkManagerBuilder: NetworkManagerRequestProtocol {
    
    var urlString: String
    var httpMethod: HttpMethod
    var parameters: [String: Any]?
    
    init(urlString: String, httpMethod: HttpMethod = .GET, parameters: [String: Any]? = nil) {
        self.urlString = urlString
        self.httpMethod = httpMethod
        self.parameters = parameters
    }
}
