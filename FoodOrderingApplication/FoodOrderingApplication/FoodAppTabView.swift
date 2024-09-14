//
//  ContentView.swift
//  FoodOrderingApplication
//
//  Created by aman on 02/06/24.
//

import SwiftUI

struct FoodAppTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            FoodListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
                .badge(order.items.count)
        }
        .accentColor(Color("brandPrimary"))
    }
}

#Preview {
    FoodAppTabView()
}
