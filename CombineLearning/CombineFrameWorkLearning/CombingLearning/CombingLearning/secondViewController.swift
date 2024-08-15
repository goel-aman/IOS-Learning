//
//  secondViewController.swift
//  CombingLearning
//
//  Created by aman on 14/08/24.
//

import UIKit
import Combine

// Refactored Code.

class secondViewController: UIViewController {
    @IBOutlet weak var counterValue: UILabel!
    
    @IBOutlet weak var buttonTapped: UIButton!
    
    var counter = Counter()
    
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    
    @IBAction func buttonClicked(_ sender: Any) {
        counter.incrementValue()
    }
    
    func bind() {
        // $ identifier lets you access the generated publisher instance
        
        counter.$counter.assign(to: \.text!, on: counterValue).store(in: &cancellables)
    }
    
}


class Counter {
    @Published private(set) var counter: String = "0"
    
    var value = 0
    
    func incrementValue() {
        value = value + 1
        counter = "\(value)"
    }
    
}
