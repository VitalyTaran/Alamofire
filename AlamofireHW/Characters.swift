//
//  Characters.swift
//  AlamofireHW
//
//  Created by Виталий Таран on 07.08.2022.
//

import Foundation

struct DataMarvel: Decodable {
    let data: Results

struct Results: Decodable {
    let results: [Character]
}
}

struct Character: Decodable {
    let name: String
    let description: String
    let thumbnail: ImagePath
    let comics: Available

    struct ImagePath: Decodable {
        let path: String
        let imageExtension: String

        enum CodingKeys: String, CodingKey {
            case path
            case imageExtension = "extension"
        }
    }

    struct Available: Decodable {
        let available: Int
    }


}
