//
//  SecondViewController.swift
//  SwiftCoordinatorPattern
//
//  Created by aman on 21/12/24.
//

import Foundation
import UIKit

class SecondViewController: UIViewController, Coordinating {
    var coordinator: (any Coordinator)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Second"
        view.backgroundColor = .blue
    }
    
    
}
