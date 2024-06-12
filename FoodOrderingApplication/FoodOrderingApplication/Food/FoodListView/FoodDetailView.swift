//
//  FoodDetailView.swift
//  FoodOrderingApplication
//
//  Created by aman on 07/06/24.
//

import SwiftUI

struct FoodDetailView: View {
    @Binding var isShowingDetail: Bool 
    let food: FoodModel
    
    var body: some View {
        
        VStack {
            foodImageView(urlString: food.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(food.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                
                Text(food.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack (spacing: 40) {
                    NutritionInfo(title: "Calories", value: String(food.calories))
                    
                    NutritionInfo(title: "Carbs", value: "\(food.carbs)")
                    
                    NutritionInfo(title: "Protein", value: "\(food.protein)")
                }
            }
            
            Spacer()
            
            Button {
                print("tapped")
            } label: {
                Text("$\(food.price, specifier: "%.2f") - Add T o Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white)
                    .background(Color("brandPrimary"))
                    .cornerRadius(10)
                
            }
            .padding(.bottom, 30)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            Button {
                isShowingDetail = false
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .opacity(0.6)
                    
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .frame(width: 44, height: 44)
                        .foregroundColor(.black)
                }
            },alignment: .topTrailing)
    }
}

#Preview {
    FoodDetailView(isShowingDetail: .constant(true), food: MockData.sampleFood)
}

struct NutritionInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack (spacing: 5) {
            Text("\(title)")
                .font(.caption)
                .fontWeight(.bold)
            
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
            
        }
    }
}
