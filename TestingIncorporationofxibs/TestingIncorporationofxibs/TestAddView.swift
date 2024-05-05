//
//  TestAddView.swift
//  TestingIncorporationofxibs
//
//  Created by aman on 05/05/24.
//

import UIKit

class TestAddView: UIView {
    @IBOutlet var containerView: UIView!
    

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        commitInit()
    }
    
    private func commitInit() {
        Bundle.main.loadNibNamed("testAddView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
