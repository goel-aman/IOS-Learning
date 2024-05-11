//
//  IconsBootcamp.swift
//  SwiftUILearning
//
//  Created by aman on 10/05/24.
//

import SwiftUI

struct IconsBootcamp: View {
    var body: some View {
        Image(systemName: "person.fill.badge.plus")
            .renderingMode(.original)
//            .resizable()
//            .scaledToFit()
//            .aspectRatio(contentMode: .fit)
//            .font(.system(size: 200))
//            .foregroundColor(.green)
            .frame(width: 300, height: 300)
//            .border(.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
//            .clipped()
        
    }
}

#Preview {
    IconsBootcamp()
}
