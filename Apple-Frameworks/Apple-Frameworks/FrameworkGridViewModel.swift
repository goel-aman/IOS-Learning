//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by aman on 19/05/24.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
}
