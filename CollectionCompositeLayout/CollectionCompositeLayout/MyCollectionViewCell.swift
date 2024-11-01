//
//  MyCollectionViewCell.swift
//  CollectionCompositeLayout
//
//  Created by aman on 01/11/24.
//

import Foundation
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        
        let images: [UIImage] = [
            UIImage(named: "DriedFlowers"),
            UIImage(named: "Mountains"),
            UIImage(named: "HorseImage")
        ].compactMap({ $0 })
        
        imageView.image = images.randomElement()
        contentView.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
