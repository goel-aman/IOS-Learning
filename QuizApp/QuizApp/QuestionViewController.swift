//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by aman on 08/10/24.
//

import Foundation
import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerLabel: UILabel!
    private var question: String = ""
    private var options: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerLabel.text = question
        
        tableView.dataSource = self
    }
    
    convenience init(question: String, options: [String]) {
        self.init()
        self.question = question
        self.options = options
    }
    
    /// Mark: TableView Headers.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
}


