//
//  Order.swift
//  FoodOrderingApplication
//
//  Created by aman on 09/09/24.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [FoodModel] = []
}
