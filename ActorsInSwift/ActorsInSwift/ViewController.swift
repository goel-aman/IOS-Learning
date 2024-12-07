//
//  ViewController.swift
//  ActorsInSwift
//
//  Created by aman on 31/08/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        let phoneStock = PhoneStocks()
                
        let dispatchQueue = DispatchQueue(label: "myQueue", attributes: [.concurrent])
        
        dispatchQueue.async {
            Task.detached {
                await phoneStock.purchase(phone: "iPhone 13")
            }
           
        }
        
        dispatchQueue.async {
            Task.detached {
                await phoneStock.getAvailablePhones()
            }
        }
    }
}

