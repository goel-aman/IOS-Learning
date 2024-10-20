//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by aman on 20/10/24.
//

import UIKit

class ViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items: [Person]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // get items from core data
        fetchPeople()
    }
    
    func fetchPeople() {
        // Fetch the data from Core Data to display in the tableView
        do {
            self.items = try context.fetch(Person.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            
        }
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add Person", message: "what is their name?", preferredStyle: .alert)
        
        alert.addTextField()
        
        // Configure Button Handler....
        let submitButton = UIAlertAction(title: "Add", style: .default) { action in
            let textfield = alert.textFields![0]
            
            let newPerson = Person(context: self.context)
            newPerson.name = textfield.text
            newPerson.age = 20
            newPerson.gender = "male"
            
            do {
                try self.context.save()
            } catch {
                //manage these errors....
            }
            
            self.fetchPeople()
        }
        
        alert.addAction(submitButton)
        
        self.present(alert, animated: true, completion: nil)
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell", for: indexPath)
        let person = self.items?[indexPath.row]
        cell.textLabel?.text = person?.name ?? ""
        return cell
    }
}

