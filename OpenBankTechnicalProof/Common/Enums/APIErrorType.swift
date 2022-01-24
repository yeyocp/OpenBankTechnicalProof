//
//  APIErrorType.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import Foundation

enum APIErrorType: Error {
    case generalServiceError
    case badRequestError
    case unauthorisedError
    case serviceUnavailable
    
    enum ResponseValidationError: Error {
        case jsonParsingError
    }
}

enum StatusCodes: Int {
    // Client error
    case code400BadRequest = 400
    case code401Unauthorised = 401
    case code403Forbidden = 403
    case code404NotFound = 404
    
    // Server error
    case code500InternalServerError = 500
    case code501NotImplemented = 501
    case code502BadGateway = 502
    case code503ServiceUnavailable = 503
    
    var code: Int {
        return rawValue
    }
    
    static func apiErrorType(_ statusCode: Int) -> APIErrorType {
        switch statusCode {
        case StatusCodes.code400BadRequest.code:
            return APIErrorType.badRequestError
        case StatusCodes.code401Unauthorised.code:
            return APIErrorType.unauthorisedError
        case StatusCodes.code500InternalServerError.code:
            return APIErrorType.serviceUnavailable
        default:
            return APIErrorType.generalServiceError
        }
    }
}

