//
//  NetworkParser.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 21/1/22.
//

import Foundation

protocol NetworkParser {
    init(data: Data) throws
}

extension NetworkParser where Self: Decodable {
    init(data: Data) throws {
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: data)
    }
}
