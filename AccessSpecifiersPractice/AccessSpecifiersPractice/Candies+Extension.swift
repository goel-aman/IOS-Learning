//
//  Candies+Extension.swift
//  AccessSpecifiersPractice
//
//  Created by aman on 12/07/24.
//

import Foundation

extension Candies {
    func setNameToBrownChocolates() {
        self.candyName = "brown"
    }
}



class B {
    var candiesObject = Candies()
    
    func printCandiesName() {
        print(candiesObject.candyName)
    }
}
