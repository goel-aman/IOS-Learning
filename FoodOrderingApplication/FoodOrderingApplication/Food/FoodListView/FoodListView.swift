//
//  FoodListView.swift
//  FoodOrderingApplication
//
//  Created by aman on 02/06/24.
//

import SwiftUI

struct FoodListView: View {
    @StateObject var viewModel = FoodListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedFood: FoodModel?
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.foods) { food in
                    FoodLIstViewCell(food: food)
                        .onTapGesture {
                            isShowingDetail = true
                            selectedFood = food
                        }
                }
                .disabled(isShowingDetail)
                .navigationTitle("Meals")
            }
            .onAppear {
                viewModel.getFoods()
            }
            .blur(radius: isShowingDetail ? 3 : 0)
            
            
            if isShowingDetail {
                FoodDetailView(isShowingDetail: $isShowingDetail, food: selectedFood!)
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
