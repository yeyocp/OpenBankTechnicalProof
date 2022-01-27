//
//  NetworkAPIClientMock.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 25/1/22.
//

import Foundation

class NetworkAPIClientMock: NetworkManagerProtocol {
    
    let jsonFilePath: String
    
    init(_ jsonFile: String) {
        self.jsonFilePath = jsonFile
    }
    
    func execute<T>(serviceRequest: NetworkManagerRequestProtocol,
                    completion: @escaping (Result<T>) -> Void) where T: NetworkParser {
        
        if let file = Bundle(for: type(of: self)).url(forResource: self.jsonFilePath, withExtension: "json") {
            do {
                let data = try Data(contentsOf: file)
                let parser = try T(data: data)
                completion(Result.success(parser))
            } catch {
                completion(Result.failure(APIErrorType.ResponseValidationError.jsonParsingError, nil))
            }
        } else {
            completion(Result.failure(APIErrorType.ResponseValidationError.jsonParsingError, nil))
        }
    }
}
