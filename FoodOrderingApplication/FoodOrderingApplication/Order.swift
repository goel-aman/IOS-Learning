//
//  Order.swift
//  FoodOrderingApplication
//
//  Created by aman on 09/09/24.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [FoodModel] = []
    
    var totalPrice: Double {
        return items.reduce(0) { first, second in
            return first + second.price
        }
    }
}
