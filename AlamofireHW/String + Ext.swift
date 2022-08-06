//
//  String + Ext.swift
//  AlamofireHW
//
//  Created by Виталий Таран on 07.08.2022.
//

import Foundation

extension String {
    var makeUrlThumb: String {
        let i = self.index(self.startIndex, offsetBy: 4)
        var newString = self
        newString.insert("s", at: i)
        return newString + "/standard_small."
    }

    var makeUrlPortrait: String {
        let i = self.index(self.startIndex, offsetBy: 4)
        var newString = self
        newString.insert("s", at: i)
        return newString + "/portrait_uncanny."
    }

}
