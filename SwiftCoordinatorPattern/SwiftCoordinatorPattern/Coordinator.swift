//
//  Coordinator.swift
//  SwiftCoordinatorPattern
//
//  Created by aman on 21/12/24.
//

import Foundation
import UIKit

enum Event {
    case buttonTapped
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    var children: [Coordinator]? { get set }
    
    func eventOccurred(with type: Event)
    
    func start()
}


protocol Coordinating {
    var coordinator: Coordinator? { get set }
}

