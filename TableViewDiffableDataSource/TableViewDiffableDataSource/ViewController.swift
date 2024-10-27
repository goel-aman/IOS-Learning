//
//  ViewController.swift
//  TableViewDiffableDataSource
//
//  Created by aman on 27/10/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    enum Section {
        case first
    }
    
    struct Fruit: Hashable {
        let title: String
    }
    
    var fruits = [Fruit]()
    
    var dataSource: UITableViewDiffableDataSource<Section, Fruit>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = itemIdentifier.title
            return cell
        })
        
        title = "My Fruit"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(didTapAdd))
    }
    
    @objc func didTapAdd() {
        let actionSheet = UIAlertController(title: "Select Fruit", message: nil, preferredStyle: .actionSheet)
        
        for x in 0...100 {
            actionSheet.addAction(UIAlertAction(title: "Fruit \(x + 1)", style: .default, handler: { [weak self] _ in
                let fruit = Fruit(title: "Fruit \(x + 1)")
                self?.fruits.append(fruit)
                self?.updateDataSource()
            }))
        }
        
        
        present(actionSheet, animated: true)
    }
    
    func updateDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Fruit>()
        snapshot.appendSections([.first])
        snapshot.appendItems(fruits)
        
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let fruit = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        
        print(fruit.title)
    }
}

