//
//  NotesViewController.swift
//  AsileTask
//
//  Created by aman on 09/11/24.
//

import Foundation
import UIKit

class NotesViewController: UIViewController {
    @IBOutlet weak var upgradeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    func setupButton() {
        upgradeButton.layer.cornerRadius = 24.5
        upgradeButton.clipsToBounds = true
    }
}
