//
//  NetworkManagerProtocol.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import UIKit
import Alamofire

typealias FailureCompletion = (Error?, APIErrorType) -> Void

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
    var path: String { get set }
    var httpMethod: HttpMethod { get set }
    var parameters: [String: Any]? { get set }
}

protocol NetworkManagerProtocol {
    func execute<T: NetworkParser>(serviceRequest: NetworkManagerRequestProtocol,
                                   alternativeBaseURL: String?,
                                   encoding: ParameterEncoding?,
                                   completion: @escaping (Result<T, FailureCompletion>) -> Void)
}

extension NetworkManagerProtocol {
    func execute<T: NetworkParser>(serviceRequest: NetworkManagerRequestProtocol,
                                   alternativeBaseURL: String?,
                                   encoding: ParameterEncoding?,
                                   completion: @escaping (Result<T, FailureCompletion>) -> Void) {
        
        return execute(serviceRequest: serviceRequest,
                       alternativeBaseURL: alternativeBaseURL,
                       encoding: encoding,
                       completion: completion)
    }
}
