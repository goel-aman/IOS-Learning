//
//  FoodDetailView.swift
//  FoodOrderingApplication
//
//  Created by aman on 07/06/24.
//

import SwiftUI

struct FoodDetailView: View {
    var body: some View {
        
        ZStack {
            
            VStack {
                
                Image("food-placeholder")
                    .resizable()
                    .frame(width: .infinity, height: 300)
                
                
                Text("Chicken Wings")
                    .fontWeight(.semibold)
                    .font(.title)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                
                Text("You'll need exta napkins with these tasty treats")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                
                
                
                HStack (spacing: 40) {
                    VStack (spacing: 20) {
                        Text("Calories")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        Text("700")
                    }
                    VStack (spacing: 20) {
                        Text("Carbs")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        Text("11 g")
                    }
                    VStack (spacing: 20) {
                        Text("Protein")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        Text("13 g")
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 80, trailing: 0))
                
                
                Button(action: {
                    
                }) {
                    Text("$11.90 - Add To Cart")
                        .padding(EdgeInsets(top: 12, leading: 70, bottom: 12, trailing: 70))
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            
            VStack {
                
                
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                    }
                    .padding(25)
                    .cornerRadius(10)
                }
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    FoodDetailView()
}
