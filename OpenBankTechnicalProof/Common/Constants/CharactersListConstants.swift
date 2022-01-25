//
//  CharactersListConstants.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 24/1/22.
//

import Foundation

struct ServiceConstants {
    static let marvelPublicKey = "ba2d2dd75e334b3e306193b6a963de58"
    static let marvelPrivateKey = "23a2d7dd5138f1f2f627b502acd639e9d9ddca93"
    
    static let baseURL = "https://gateway.marvel.com:443"
    static let charactersListPath = "/v1/public/characters?%@&apikey=%@&hash=%@"
    static let characterDetailPath = "/v1/public/characters/%@?%@&apikey=%@&hash=%@"
    
    static let timestampParameter = "ts=thesoer"
    static let timestampValue = "thesoer"
    
    static let hash = "thesoer\(ServiceConstants.marvelPrivateKey)\(ServiceConstants.marvelPublicKey)".md5
}

struct CharactersListConstants {
    static let characters = "characters.title".localized()
}

struct CharacterDetailConstants {
    static let characterDetail = "characterDetail.title".localized()
}
