//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by aman on 18/05/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            
            FrameworkTitleView(framework: framework)
             
            
            Text(framework.description)
                .padding()
                .font(.body)
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
                
            }
            Spacer()
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ??  URL(string: "www.google.com")!)
        })
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}
 
