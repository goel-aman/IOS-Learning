//
//  MainCoordinator.swift
//  SwiftCoordinatorPattern
//
//  Created by aman on 21/12/24.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var children: [any Coordinator]? = nil 
    
    var navigationController: UINavigationController?
    
    func eventOccurred(with type: Event) {
        switch type {
        case .buttonTapped:
            var vc: UIViewController & Coordinating = SecondViewController()
            vc.coordinator = self
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        var vc: UIViewController & Coordinating = ViewController()
        vc.coordinator = self
        
        navigationController?.setViewControllers([vc], animated: true)
    }
    
    
}
