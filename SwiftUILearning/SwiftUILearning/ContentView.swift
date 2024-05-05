//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by aman on 05/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.largeTitle)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
