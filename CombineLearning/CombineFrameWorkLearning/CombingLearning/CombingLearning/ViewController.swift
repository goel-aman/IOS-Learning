//
//  ViewController.swift
//  CombingLearning
//
//  Created by aman on 18/07/24.
//

import UIKit
import Combine

class ViewController: UIViewController {
    var counter = 0
    @IBOutlet weak var counterValue: UILabel!
    
    let publisher = PassthroughSubject<Int, Never>()
    
    var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bind()
    }
    
    func bind() {
        // map operator
        let resultPublisher = publisher.map { (input) -> String in
            return "\(input)"
        }
        
        resultPublisher.assign(to: \.text!, on: counterValue)
            .store(in: &cancellables)
    }

    @IBAction func buttonTapped(_ sender: Any) {
        counter = counter + 1
        publisher.send(counter)
    }
}

