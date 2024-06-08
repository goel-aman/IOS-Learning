//
//  FoodListView.swift
//  FoodOrderingApplication
//
//  Created by aman on 02/06/24.
//

import SwiftUI

struct FoodListView: View {
    @StateObject var viewModel = FoodListViewModel()
    @State private var showingPopOver = true
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.foods) { food in
                    NavigationLink(value: food) {
                        FoodLIstViewCell(food: food)
                    }
                }
                .navigationTitle("Meals")
                .navigationDestination(for: FoodModel.self) { food in
                    FoodDetailView()
                }
//                .popover(isPresented: $showingPopOver, content: {
//                    FoodDetailView()
//                })
                
            }
            .onAppear {
                viewModel.getFoods()
            }
            
            
            if  viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton:  alert.dismissButton)
        }
    }
    
    
}

#Preview {
    FoodListView()
}
