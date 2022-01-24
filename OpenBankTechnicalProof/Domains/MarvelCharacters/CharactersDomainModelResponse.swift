//
//  CharactersDomainModelResponse.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 21/1/22.
//

struct CharactersDomainModelResponse: Codable, NetworkParser {
    let data: CharactersDomainModelData
}

struct CharactersDomainModelData: Codable, NetworkParser {
    let characters: [CharacterItemDomainModel]
    
    enum CodingKeys: String, CodingKey {
        case characters = "results"
    }
}

struct CharacterItemDomainModel: Codable, NetworkParser {
    let id: Int
    let name: String
    let thumbnail: CharacterItemThumbnail
    let resourceURI: String
}

struct CharacterItemThumbnail: Codable, NetworkParser {
    let imageURL: String
    let imageExtension: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "path"
        case imageExtension = "extension"
    }
}
