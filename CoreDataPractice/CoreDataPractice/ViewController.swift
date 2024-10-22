//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by aman on 20/10/24.
//

import UIKit
import CoreData

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
    
    
    func relationshipDemo() {
        
        // Create Family
        var family = Family(context: context)
        family.name = "Abc Family"
        
        // Create A Person
        var person = Person(context: context)
        
        person.name = "Maggie"
        
        person.family = family

        
        
        
        try! context.save()
        
        
    }
    
    
    
    
    
    func fetchPeople() {
        // Fetch the data from Core Data to display in the tableView
        do {
            
            let request = Person.fetchRequest() as NSFetchRequest<Person>
            // set the filtering and sorting on the request
            
//            let pred = NSPredicate(format: "name CONTAINS %@", "aman")
//            request.predicate = pred
            
            let sort = NSSortDescriptor(key: "name", ascending: true)
            request.sortDescriptors = [sort]
            
            self.items = try context.fetch(request)
            
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // create swipe action...
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            if let personToRemove = self.items?[indexPath.row] {
                // Remove the person
                self.context.delete(personToRemove)
            }
            
            // Save the data
            do {
                try self.context.save()
            } catch {
                
            }
            
            // TODO: Re-fetch the data
            self.fetchPeople()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Selected Person
        let person = self.items![indexPath.row]
        
        // Create alert
        let alert = UIAlertController(title: "Edit Person", message: "Edit name:", preferredStyle: .alert)
        
        alert.addTextField()
        
        let textField = alert.textFields![0]
        textField.text = person.name
        
        // configure button handler
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
                
            // Get the textfield for the alert
            let textfield = alert.textFields![0]
            
            
            // Edit name property of person object
            person.name = textField.text
            
            // TODO: Save the data
            
            do {
                try self.context.save()
            } catch {
                
            }
            
            // TODO: Re-fetch the data
            
            self.fetchPeople()
        }
        
        alert.addAction(saveButton)
        
        self.present(alert, animated: true, completion: nil)
    }
}

