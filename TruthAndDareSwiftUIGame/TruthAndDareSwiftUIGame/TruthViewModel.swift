//
//  TruthViewModel.swift
//  TruthAndDareSwiftUIGame
//
//  Created by aman on 15/09/24.
//

import SwiftUI

class TruthViewModel: ObservableObject {
    @Published var currentTruth: String = "Truth is: ?"
    
    func getTruth() {
        var count = TruthAndDareData.truth.count
        
        var randomIndex = Int.random(in: 0..<count)
        
        currentTruth = TruthAndDareData.truth[randomIndex]
    }
}
