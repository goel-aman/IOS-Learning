//
//  ViewController.swift
//  TestingIncorporationofxibs
//
//  Created by aman on 04/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testAddView: TestAddView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testAddView.textLabel.text = "aman"
    }


}

