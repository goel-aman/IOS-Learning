//
//  ContentView.swift
//  swiftUI-Weather
//
//  Created by aman on 11/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightblue "))
            VStack {
                CityTextView(cityName: "Delhi, India ")
                
                MainWeatherStatusView(imageName: "cloud.sun.fill",
                                      temperature: 34)
//                Spacer()
                
                HStack (spacing: 20) {
                    WeatherDayView(dayOfWeek: "Mon", 
                                   imageName: "cloud.sun.fill",
                                   temperature: 24)
                    
                    WeatherDayView(dayOfWeek: "TUE", 
                                   imageName: "sun.max.fill",
                                   temperature: 94)
                    
                    WeatherDayView(dayOfWeek: "WED", 
                                   imageName: "sun.horizon.fill",
                                   temperature: 34)
                    
                    WeatherDayView(dayOfWeek: "THU", 
                                   imageName:"cloud.sun.rain",
                                   temperature: 42)
                    
                    WeatherDayView(dayOfWeek: "FRI", 
                                   imageName: "cloud.sun.fill",
                                   temperature: 18)
                }
                
                Spacer()
                
                Button() {
                   print("Tapped")
                } label: {
                    WeatherButton(buttonText: "Change Day Time", 
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 25, weight: .regular))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [topColor, bottomColor]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 190, height: 160, alignment: .center)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 80)
    }
}

