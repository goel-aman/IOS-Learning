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
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1))
        )
        
        item.contentInsets = NSDirectionalEdgeInsets (
            top: 2,
            leading: 2,
            bottom: 2,
            trailing: 2
        )
        
        
        
        let verticalStackItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/2)
            )
        )
        
        verticalStackItem.contentInsets = NSDirectionalEdgeInsets (top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let verticalStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3),
                                               heightDimension: .fractionalHeight(1)),
            repeatingSubitem: verticalStackItem,
            count: 2
        )
        
        let tripleItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .absolute(100)
        ))
        
        tripleItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        
                            
        
        let tripleHorizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)),
            subitem: tripleItem,
            count: 3
        )
        
                                                
        // Group
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(2/3)
            ),
            subitems: [item, verticalStackGroup]
        )
        
//        horizontalGroup.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(3/5)),
            subitems: [
                horizontalGroup,
                tripleHorizontalGroup
            ]
        )
        
        
        // Sections
        let section = NSCollectionLayoutSection(group: verticalGroup)
        
        
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

