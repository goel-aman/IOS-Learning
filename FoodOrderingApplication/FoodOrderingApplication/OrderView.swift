//
//  OrderView.swift
//  FoodOrderingApplication
//
//  Created by aman on 02/06/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            
            if order.items.count == 0 {
                EmptyState(imageName: "ListImage", message: "You don't have any item in the list")
            }else {
                VStack {
                    List {
                        ForEach(order.items) { item in
                            FoodLIstViewCell(food: item)
                        }
                        .onDelete(perform: { indexSet in
                            order.items.remove(atOffsets: indexSet)
                        })
                    }
                    .listStyle(.plain)
                    
                    
                    Button {
                        print("order placed")
                    } label: {
                        Text("\(order.totalPrice) Place Order")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(width: 260, height: 50)
                            .foregroundColor(.white)
                            .background(Color("brandPrimary"))
                            .cornerRadius(10)
                        
                    }
                    
                    
                }
                .navigationTitle("Orders")
            }
        }
    }
}

#Preview {
//    @Environment var order: Order
    OrderView()
}
