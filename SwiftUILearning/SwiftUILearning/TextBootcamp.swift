//
//  TextBootcamp.swift
//  SwiftUILearning
//
//  Created by aman on 05/05/24.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        Text("Hello, World! Aman is learning swiftUI from scratch and will be able to deploy it to the public soon.")
            .font(.body)
            .fontWeight(.heavy)
//            .underline(true, color: Color.red)
            .strikethrough()
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            .baselineOffset(20)
            .kerning(5)
            .foregroundColor(.red)
            .frame(width: 200,height: 100, alignment: .center)
            .minimumScaleFactor(1.0)
    }
}

#Preview {
    TextBootcamp()
}
