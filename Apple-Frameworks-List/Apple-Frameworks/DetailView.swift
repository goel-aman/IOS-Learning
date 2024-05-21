//
//  DetailView.swift
//  Apple-Frameworks
//
//  Created by aman on 18/05/24.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack (spacing: 40) {
            
            VStack {
                Image("app-clip")
                    .resizable()
                    .frame(width: 90, height: 90)
                Text("App Clips")
            }
            VStack {
                Text("An App Clip is a small part of your app that’s discoverable at the moment it’s needed and lets people complete a quick task from your app — even before installing your full app. Whether ordering take-out from a restaurant, renting a scooter, or setting up a new connected appliance for the first time, people can launch the App Clip to easily start and finish the task. And once the task is done, you can offer the opportunity to download your full app from the App Store.")
            }
            .padding()
            VStack {
                Button
                {
                    print("tapped")
                } label: {
                    Text("Learn More")
                    .frame(width: 320, height: 50)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(9)
                }
            }
        }
    }
}

#Preview {
    DetailView()
}
