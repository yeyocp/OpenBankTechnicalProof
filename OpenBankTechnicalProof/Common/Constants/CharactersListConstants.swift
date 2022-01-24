//
//  CharactersListConstants.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import Foundation

struct ServiceConstants {
    static let marvelApiKey = "ba2d2dd75e334b3e306193b6a963de58"
    
    static let baseURL = "https://gateway.marvel.com:443"
    static let charactersListPath = "/v1/public/characters?apikey=%@"
    static let characterDetailPath = "/v1/public/characters/1011334?apikey=%@"
}

struct CharactersListConstants {
    static let characters = "characters.title".localized()
}
