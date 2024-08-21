//
//  ViewController.swift
//  MulticasePublisherAndShareOperator
//
//  Created by aman on 21/08/24.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var thirdView: UITextView!
    @IBOutlet weak var secondView: UITextView!
    @IBOutlet weak var firstView: UITextView!
    let subject = PassthroughSubject<String, Never>()
    
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        simpleMulticast()
//        multicast()
        shareMulticast()
    }

    func valuePublisher() -> Publishers.Zip<Publishers.Sequence<[Int], Never>, Publishers.Autoconnect<Timer.TimerPublisher>> {
        
        let timerPublisher = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
        
        return Publishers.Zip([1, 2, 3, 4, 5, 6].publisher, timerPublisher)
    }
    
    func simpleMulticast() {
        let zipPublisher = valuePublisher()
        
        let publisher = zipPublisher
            .print()
            .map({
                (tuple) -> String in
                return "\(tuple.0)"
            })
            .eraseToAnyPublisher()
        
        publisher
            .map {
                "\(self.firstView.text ?? "")\n\($0)"
            }
            .assign(to: \.text, on: self.firstView)
            .store(in: &cancellables)
        
        publisher
            .map {
                "\(self.secondView.text ?? "")\n\($0)"
            }
            .assign(to: \.text, on: self.secondView)
            .store(in: &cancellables)
    }
    
    func multicast() {
        let zipPublisher = valuePublisher()
        
        let publisher = zipPublisher
            .map {
                "\($0.0)"
            }
            .print()
            .eraseToAnyPublisher()
        
        // create a multicast
        let multicast = publisher.multicast(subject: subject)
        
        multicast
            .map {
                "\(self.firstView.text ?? "")\n\($0)"
            }
            .assign(to: \.text, on: self.firstView)
            .store(in: &cancellables)
        
        multicast
            .map {
                "\(self.secondView.text ?? "")\n\($0)"
            }
            .assign(to: \.text, on: self.secondView)
            .store(in: &cancellables)
        
        self.thirdView.text = "\n\n\n"
        
        
        // Connect Me
        multicast.connect().store(in: &cancellables )
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            multicast
                .map {
                    "\(self.thirdView.text ?? "")\n\($0)"
                }
                .assign(to: \.text, on: self.thirdView)
                .store(in: &self.cancellables)
        }
    }
    
    func shareMulticast() {
        let zipPublisher = valuePublisher()
        
        let publisher = zipPublisher
            .map { $0.0 }
            .print()
            .eraseToAnyPublisher()
        
        
        let multicastSubject = publisher.share()
        
        multicastSubject
            .map {
                "\(self.firstView.text ?? "")\n\($0)"
            }
            .assign(to: \.text, on: self.firstView)
            .store(in: &cancellables)
        
        multicastSubject
            .map {
                "\(self.secondView.text ?? "")\n\($0)"
            }
            .assign(to: \.text, on: self.secondView)
            .store(in: &cancellables)
        
        self.thirdView.text = "\n\n\n"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            multicastSubject
                .map {
                    "\(self.thirdView.text ?? "")\n\($0)"
                }
                .assign(to: \.text, on: self.thirdView)
                .store(in: &self.cancellables)
        }
    }
    
}

