//
//  ContentView.swift
//  DiffableDatasourceInSwift
//
//  Created by aman on 26/10/24.
//

import SwiftUI

enum SectionType {
    case ceo, peasants
}

struct Contact: Hashable {
    let name: String
}

class DiffableTableViewController: UITableViewController {
    
    // UITableViewDiffableDataSource
    
    lazy var  source: UITableViewDiffableDataSource<SectionType, Contact> = .init(tableView: tableView) { (tableView,indexPath,itemIdentifier) -> UITableViewCell? in
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text =  itemIdentifier.name
        return cell
    }
    
    private func setupSource() {
        var snapshot = source.snapshot()
        snapshot.appendSections([.ceo, .peasants])
        snapshot.appendItems([.init(name: "Aman"), .init(name: "Tim Cook"), .init(name: "Whatever")], toSection: .ceo)
        
        snapshot.appendItems([.init(name: "Bill Gates")], toSection: .peasants)
        source.apply(snapshot)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupSource()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = section == 0 ? "CEO" : "Peasant"
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

struct DiffableContainer: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        return UINavigationController(rootViewController: DiffableTableViewController(style: .insetGrouped))
    }
    
    typealias UIViewControllerType = UIViewController
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    DiffableContainer()
}
