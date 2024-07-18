//
//  OrderView.swift
//  FoodOrderingApplication
//
//  Created by aman on 02/06/24.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                List {
                    ForEach(<#T##data: RandomAccessCollection##RandomAccessCollection#>, id: <#T##KeyPath<RandomAccessCollection.Element, Hashable>#>, content: <#T##(RandomAccessCollection.Element) -> AccessibilityRotorContent#>)
                }
            }
            .navigationTitle("Orders")
        }
    }
}

#Preview {
    OrderView()
}
