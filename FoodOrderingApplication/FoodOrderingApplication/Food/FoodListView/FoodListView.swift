//
//  FoodListView.swift
//  FoodOrderingApplication
//
//  Created by aman on 02/06/24.
//

import SwiftUI

struct FoodListView: View {
    @StateObject var viewModel = FoodListViewModel()

    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.foods) { food in
                    FoodLIstViewCell(food: food)
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.selectedFood = food
                        }
                }
                .disabled(viewModel.isShowingDetail)
                .navigationTitle("Meals")
            }
            .task {
                viewModel.getFoods()
            }
            .blur(radius: viewModel.isShowingDetail ? 3 : 0)
            
            
            if viewModel.isShowingDetail {
                FoodDetailView(isShowingDetail: $viewModel.isShowingDetail, food: viewModel.selectedFood!)
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
