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
                Color(color)
            )
            .frame(width: 300, height: 300)
            
    }
}

#Preview {
    ColorsBootcamp()
}
