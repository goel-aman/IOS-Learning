//
//  EmptyState.swift
//  FoodOrderingApplication
//
//  Created by aman on 09/09/24.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(30)
                
                Text(message)
            }
        }
    }
}

#Preview {
    EmptyState(imageName: "ListImage", message: "You don't have any item in the list....")
}
