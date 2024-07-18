import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let operationQueue: OperationQueue = OperationQueue()
        
        let firstOperation: BlockOperation = BlockOperation {
            self.printOneToTen()
        }
        
        let secondOperation: BlockOperation = BlockOperation {
            self.printElevenToTwenty()
        }
        
        secondOperation.addDependency(firstOperation)
        operationQueue.addOperation(firstOperation)
        operationQueue.addOperation(secondOperation)
        
        print("view did load completed")
    }
    
    func printOneToTen() {
        DispatchQueue.global().async {
            for i in 1...10 {
                print(i)
            }
        }
    }
    
    func printElevenToTwenty() {
        DispatchQueue.global().async {
            for i in 11...20 {
                print(i)
            }
        }
    }
}


class AsyncOperation: Operation {
    enum State: String {
        case isReady
        case isExecuting
        case isFinished
    }
    
    var state: State = .isReady {
        willSet(newValue) {
            willChangeValue(forKey: state.rawValue)
            willChangeValue(forKey: newValue.rawValue)
        }
        didSet {
            didChangeValue(forKey: oldValue.rawValue)
            didChangeValue(forKey: state.rawValue)
        }
    }
}


