//
//  ViewController.swift
//  TestingIfMemoryLeaksExistOrNot
//
//  Created by aman on 02/01/25.
//

import UIKit

class A {
    weak var b: B?

    init() { self.b = B(a: self) }
}

class B {
    var a: A

    init(a: A) { self.a = a }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

