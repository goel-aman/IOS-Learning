//
//  ContentView.swift
//  TruthAndDareSwiftUIGame
//
//  Created by aman on 15/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {

            TruthView()
                .tabItem {
                    Label("Truth", systemImage: "text.quote")
                }
            
            DareUIView()
                .tabItem {
                    Label("Dare", systemImage: "figure.walk.motion")
                }
        }
    }
}

#Preview {
    ContentView()
}
