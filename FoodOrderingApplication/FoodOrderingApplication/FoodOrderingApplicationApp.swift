//
//  FoodOrderingApplicationApp.swift
//  FoodOrderingApplication
//
//  Created by aman on 02/06/24.
//

import SwiftUI

@main
struct FoodOrderingApplicationApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            FoodAppTabView().environmentObject(order)
        }
    }
}

