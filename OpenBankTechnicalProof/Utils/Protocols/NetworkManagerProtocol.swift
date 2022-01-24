//
//  NetworkManagerProtocol.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import UIKit

typealias FailureCompletion = (Error?, APIErrorType) -> Void

public enum Result<T> {
    case success(T)
    case failure(Error, Int?)
}

enum HttpMethod: Int {
    case GET, POST, PUT, DELETE
    
    func toStringMethod() -> String {
        switch self {
        case .GET:
            return "GET"
        case .POST:
            return "POST"
        case .PUT:
            return "PUT"
        case .DELETE:
            return "DELETE"
        }
    }
}

protocol NetworkManagerRequestProtocol {
    var urlString: String { get set }
    var httpMethod: HttpMethod { get set }
    var parameters: [String: Any]? { get set }
}

protocol NetworkManagerProtocol {
    func execute<T: NetworkParser>(serviceRequest: NetworkManagerRequestProtocol,
                                   completion: @escaping (Result<T>) -> Void)
    
    func handleAPIErrors(statusCode: Int?) -> APIErrorType
}

extension NetworkManagerProtocol {
    func execute<T: NetworkParser>(serviceRequest: NetworkManagerRequestProtocol,
                                   completion: @escaping (Result<T>) -> Void) {
        return execute(serviceRequest: serviceRequest,
                       completion: completion)
    }
    
    func handleAPIErrors(statusCode: Int?) -> APIErrorType {
        guard let statusCode = statusCode else {
            return APIErrorType.generalServiceError
        }
        
        return StatusCodes.apiErrorType(statusCode)
    }
}
