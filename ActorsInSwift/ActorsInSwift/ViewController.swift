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
        
        let flight: Flight = Flight()
        
        let queue1: DispatchQueue = DispatchQueue(label: "queue1")
        let queue2: DispatchQueue = DispatchQueue(label: "queue2")
        
        queue1.async {
            let bookedSeat: String = flight.bookSeats()
            
        }
    }


}

