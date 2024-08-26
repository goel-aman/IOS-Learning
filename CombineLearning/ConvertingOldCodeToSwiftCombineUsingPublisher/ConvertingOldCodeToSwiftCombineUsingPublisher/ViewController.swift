//
//  ViewController.swift
//  ConvertingOldCodeToSwiftCombineUsingPublisher
//
//  Created by aman on 21/08/24.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var counterValue: UILabel!
    
    var store = Set<AnyCancellable>()
    
    var model = SomeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        model.$state
            .map {
                return "\($0)"
            }.assign(to: \.text , on: counterValue)
            .store(in: &store)
    }

    @IBAction func ButtonClicked(_ sender: Any) {
        model.state = model.state + 1
    }
}

class SomeModel {
    @Published var state: Int = 0
}

