//
//  FoodLIstViewCell.swift
//  FoodOrderingApplication
//
//  Created by aman on 03/06/24.
//

import SwiftUI

struct FoodLIstViewCell: View {
    let food: FoodModel
    
    var body: some View {
        HStack {
            foodImageView(urlString: food.imageURL)
//                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(8.0)
                
            
            VStack (alignment: .leading, spacing: 5) {
                
                Text("\(food.name)")
                    .fontWeight(.medium)
                
                Text("$\(food.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    FoodLIstViewCell(food: MockData.sampleFood)
}
