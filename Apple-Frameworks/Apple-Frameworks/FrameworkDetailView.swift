//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by aman on 18/05/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
            
            
            Spacer()
            FrameworkTitleView(framework: framework)
             
            
            Text(framework.description)
                .padding()
                .font(.body)
            
            Spacer()
            
            Button {
                
            } label: {
                AFButton(title: "Learn More")
                
            }
            Spacer()
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}
 
