//
//  TruthView.swift
//  TruthAndDareSwiftUIGame
//
//  Created by aman on 15/09/24.
//

import SwiftUI

struct TruthView: View {
    
    @StateObject private var viewModel = TruthViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(viewModel.currentTruth)
            
            Spacer()
            
            Button {
                viewModel.getTruth()
            } label: {
                Text("Next Truth Challenge")
            }
            
            Spacer()
        }
    }
}

#Preview {
    TruthView()
}
