//
//  ComicsModel.swift
//  AlamofireHW
//
//  Created by Виталий Таран on 08.08.2022.
//

import Foundation

struct MarvelResponse: Decodable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: MarvelResult
}

struct MarvelResult: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Character]
}

struct Character: Decodable {
    let id: Int
    let name: String
    let description: String?
    let modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics: ItemCollection
    let series: ItemCollection
    let stories: ItemCollection
    let events: ItemCollection
    let urls: [URLItem]
}

struct Thumbnail: Decodable {
    let path: String
    let ext: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}

struct ItemCollection: Decodable {
    let available: Int
    let collectionURI: String
    let items: [Item]
    let returned: Int
}

struct Item: Decodable {
    let resourceURI: String
    let name: String
    let type: String?
    
    var unrappedType: String {
        type ?? "No type available"
    }
}

struct URLItem: Decodable {
    let type: String
    let url: String
}

struct PrintableCharacter {
    let name: String
}
