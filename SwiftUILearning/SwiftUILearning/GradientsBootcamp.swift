//
//  GradientsBootcamp.swift
//  SwiftUILearning
//
//  Created by aman on 10/05/24.
//

import SwiftUI

struct GradientsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .fill(
                //Color.red
//                LinearGradient(colors: [.pink, Color.blue, Color.orange], startPoint: .leading, endPoint: .trailing)
                
//                RadialGradient(colors: [.red, .blue], center: .topLeading, startRadius: 5, endRadius: 300)
                
                AngularGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .topLeading)
            )
            .frame(width: 300, height: 200)
    }
}

#Preview {
    GradientsBootcamp()
}
