//
//  Candies.swift
//  AccessSpecifiersPractice
//
//  Created by aman on 12/07/24.
//

import Foundation

class Candies {
    fileprivate var candyName = "dark-chocolate"
}


extension Candies {
    func setNameToWhite() {
        candyName = "white-chocolate"
    }
}

class C {
    var candiesObject = Candies()
    
    func setName() {
        candiesObject.candyName = "aman"
    }
}
