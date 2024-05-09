//
//  ViewController.swift
//  popUpView
//
//  Created by aman on 09/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var closePopUpButton: UIButton!
    
    @IBOutlet weak var redView: UIView!
    
    var array = ["aman", "rahul", "mohit", "sunil", "monu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        closePopUpButton.alpha = 0
        redView.isHidden = true
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        
        redView.isHidden = true
        closePopUpButton.alpha = 0
//        redView.isHidden = true
//        closePopUpButton.alpha
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        closePopUpButton.alpha = 0.55
        redView.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

