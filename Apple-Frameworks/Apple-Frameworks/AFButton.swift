//
//  AFButton.swift
//  Apple-Frameworks
//
//  Created by aman on 18/05/24.
//

import SwiftUI

struct AFButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(9)
    }
}

#Preview {
    AFButton(title: "Learn More")
}
