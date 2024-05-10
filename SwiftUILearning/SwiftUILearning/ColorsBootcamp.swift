//
//  ColorsBootcamp.swift
//  SwiftUILearning
//
//  Created by aman on 05/05/24.
//

import SwiftUI

struct ColorsBootcamp: View {
    var color = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
//                Color(color)
//                Color(UIColor.secondarySystemBackground)
                Color("customColors")
            )
            .frame(width: 300, height: 300)
//            .shadow(radius: 10)
//            .shadow(color: .black, radius: 10)
        
            .shadow(radius: 10,x: 10, y: 20)
    }
}

#Preview {
    ColorsBootcamp()
}
