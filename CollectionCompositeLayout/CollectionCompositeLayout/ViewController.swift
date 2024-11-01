//
//  ViewController.swift
//  CollectionCompositeLayout
//
//  Created by aman on 01/11/24.
//

import UIKit

class ViewController: UIViewController {

    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: ViewController.createLayout()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(collectionView)
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
    }
    
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        // Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize (
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1))
        )
        
        // Group
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(15/100)
            ),
            subitem: item,
            count: 2
        )
        
        // Sections
        let section = NSCollectionLayoutSection(group: group)
        
        
        // Return
        return UICollectionViewCompositionalLayout(section: section)
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
        return cell
    }
}

