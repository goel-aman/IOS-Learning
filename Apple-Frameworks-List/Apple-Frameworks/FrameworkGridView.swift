//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by aman on 16/05/24.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()


    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                print("Framework Tapped")
                                
                                viewModel.selectedFramework = framework
                            }
                    }
                }
                .navigationTitle("Apple Frameworks")
            }
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
    }
}


#Preview {
    FrameworkGridView()
}


