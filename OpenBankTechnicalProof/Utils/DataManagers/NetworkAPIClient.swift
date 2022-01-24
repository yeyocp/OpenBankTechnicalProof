//
//  NetworkAPIClient.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import Foundation

final class NetworkAPIClient: NetworkManagerProtocol {
    
    // MARK: - Singleton -
    
    private static let sharedNetworkAPIClient = NetworkAPIClient()
    
    // MARK: - Accesible singleton -
    
    static func shared() -> NetworkManagerProtocol {
        sharedNetworkAPIClient
    }
    
    // MARK: - Internal Methods -
    
    func execute<T: NetworkParser>(serviceRequest: NetworkManagerRequestProtocol,
                                   completion: @escaping (Result<T>) -> Void) {
        
        guard let urlConvertible = URL(string: serviceRequest.urlString) else {
            completion(Result.failure(APIErrorType.badRequestError, nil))
            return
        }
        
        URLSession.shared.dataTask(with: urlConvertible) { (data, response, error) in
            if let error = error {
                if let response = response as? HTTPURLResponse {
                    completion(.failure(error, response.statusCode))
                } else {
                    completion(.failure(error, nil))
                }
                
                return
            } else if let data = data {
                do {
                    completion(.success(try .init(data: data)))
                } catch {
                    completion(.failure(error, nil))
                }
            }
        }.resume()
    }
}
