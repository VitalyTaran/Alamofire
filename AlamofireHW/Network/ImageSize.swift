//
//  ImageSize.swift
//  AlamofireHW
//
//  Created by Виталий Таран on 08.08.2022.
//

import Foundation

enum ImageSize {
    case small
    case portrait

    var set: String {
        switch self {
        case .small:
            return "/standard_small."
        case .portrait:
            return "/portrait_uncanny."
        }
    }
}
