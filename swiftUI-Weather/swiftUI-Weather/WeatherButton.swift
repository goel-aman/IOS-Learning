//
//  WeatherButton.swift
//  swiftUI-Weather
//
//  Created by aman on 12/05/24.
//

import SwiftUI
 
struct WeatherButton: View {
    var buttonText: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text("\(buttonText)")
           .frame(width: 280, height: 50)
           .foregroundColor(textColor)
           .background(backgroundColor.gradient)
           .font(.system(size: 20, weight: .bold, design: .default))
           .cornerRadius(9)
    }
}
