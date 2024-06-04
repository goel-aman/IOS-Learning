//
//  FoodListView.swift
//  FoodOrderingApplication
//
//  Created by aman on 02/06/24.
//

import SwiftUI

struct FoodListView: View {
    
    @State private var foods: [Food] = []
    
    var body: some View {
        NavigationView {
            List(foods) { food in
                FoodLIstViewCell(food: MockData.sampleFood)
            }
            .navigationTitle("Meals")
        }
        .onAppear {
            getFoods()
        }
    }
    
    func getFoods() {
        networkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                    // after setting up the variable SWiftUI is going to update the view hence it should execute on the main thread.
                    
                case .success(let foods):
                    self.foods = foods
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
            }
        }
        
    }
}

#Preview {
    FoodListView()
}
