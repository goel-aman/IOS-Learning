//
//  ViewController.swift
//  combineMapOperator
//
//  Created by aman on 18/08/24.
//

import UIKit
import Combine

struct FormField1 {
    var value: Int
}

class ViewController: UIViewController {
    
    let textField1 = UITextField(frame: .zero)
    
    var cancellables = Set<AnyCancellable>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        constructTextFields()
        
        textField1.textPublisher
            .map({ value -> FormField1 in
                return FormField1(value: Int(value) ?? 0)
            })
            .sink { value in
                
            print(value)
        }.store(in: &cancellables)
    }
    
    func constructTextFields() {
        textField1.translatesAutoresizingMaskIntoConstraints = false
        
        textField1.borderStyle = .roundedRect
        textField1.keyboardType = .numberPad
        textField1.textColor = .darkGray
        textField1.font = .systemFont(ofSize: 40)
        
        view.addSubview(textField1)
        
        
        textField1.widthAnchor.constraint(equalToConstant: 150).isActive = true
        textField1.heightAnchor.constraint(equalToConstant: 150).isActive = true
        textField1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
    }
}

extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map { $0.text ?? "" }
            .eraseToAnyPublisher()
    }
}
