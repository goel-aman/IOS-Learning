//
//  PhoneStocks.swift
//  ActorsInSwift
//
//  Created by aman on 02/12/24.
//

import UIKit
import Foundation

actor PhoneStocks {
    var stocks: Array<String> = ["iPhone 13", "Samsung S 21", "Pixel 4"]
    
    func getAvailablePhones() {
        // read operation always happens on sync block.
        print("available phones for purchase are = \(stocks)")
    }
    
    
    func purchase(phone: String) {
        guard let index = self.stocks.firstIndex(of: phone) else {
            print("no such item in the stocks")
            return
        }
        
        self.stocks.remove(at: index)
        print("Congratulations on purchase of a new \(phone)")
    }
}

