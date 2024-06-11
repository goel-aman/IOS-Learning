//
//  FoodListViewModel.swift
//  FoodOrderingApplication
//
//  Created by aman on 04/06/24.
//

import Foundation

final class FoodListViewModel: ObservableObject {
    
    @Published var foods: [FoodModel] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedFood: FoodModel?
    
    func getFoods() {
        isLoading = true
        networkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async { [self] in
                isLoading = false 
                switch result {
                    
                     // after setting up the variable SWiftUI is going to update the view hence it should execute on the main thread.
                    
                case .success(let foods):
                    self.foods = foods
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                        
                    }
                    
                }
            }
        }
    }
}
