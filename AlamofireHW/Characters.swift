//
//  Characters.swift
//  AlamofireHW
//
//  Created by Виталий Таран on 07.08.2022.
//

import Foundation

struct Characters: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let name: String
    let descriptions: String
    let thumbnail: ImagePath
    let comics: Available

    struct ImagePath: Decodable {
        let path: String
        let extention: String
    }

    struct Available: Decodable {
        let available: Int
    }
}
