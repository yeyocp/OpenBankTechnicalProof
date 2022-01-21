//
//  MarvelCharactersDomainModelResponse.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 21/1/22.
//

struct MarvelCharactersDomainModelResponse: Codable, NetworkParser {
    let data: MarvelCharactersDomainModelData
}

struct MarvelCharactersDomainModelData: Codable, NetworkParser {
    let characters: [MarvelCharacterItemDomainModel]
    
    enum CodingKeys: String, CodingKey {
        case characters = "results"
    }
}

struct MarvelCharacterItemDomainModel: Codable, NetworkParser {
    let id: Int
    let name: String
    let thumbnail: MarvelCharacterItemThumbnail
    let resourceURI: String
}

struct MarvelCharacterItemThumbnail: Codable, NetworkParser {
    let imageURL: String
    let imageExtension: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "path"
        case imageExtension = "extension"
    }
}
