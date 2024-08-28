//
//  ViewController.swift
//  MigratingAsynchronousCodeToUseCombine-Futures
//
//  Created by aman on 27/08/24.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var async: UIButton!
    
    @IBOutlet weak var futureButton: UIButton!
    
    @IBOutlet weak var futureErrorButton: UIButton!
    
    @IBOutlet weak var showContent: UILabel!
    
    var cancellable = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func asyncButtonClicked(_ sender: Any) {
        performAsyncTask()
    }
    
    @IBAction func futureButtonClicked(_ sender: Any) {
        performFutureTask()
    }
    
    
    @IBAction func performFutureErrorTask(_ sender: Any) {
        performFutureTaskError()
    }
    
    func performAsyncTask() {
        let lib = ThirdPartyLibrary()
        showContent.text = "Performing async task..."
        lib.performAsyncAction { [weak self] in
            self?.showContent.text = "Async task completed"
        }
    }
    
    func performFutureTask() {
        let lib = ThirdPartyLibrary()
        showContent.text = "performing future task"
        lib.performAsyncActionFuture().sink { [weak self] in
            self?.showContent.text = "Future task completed"
        }.store(in: &cancellable)
    }
    
    func performFutureTaskError() {
        let lib = ThirdPartyLibrary()
        showContent.text = "performing future task with error"
        lib.performAsyncActionFutureError().sink { [weak self] completion in
            switch completion {
            case .failure(.message(let error)):
                self?.showContent.text = "\(error)"
            case .finished:
                break
//                self?.showContent.text = "Async Task Completed"
            }
        } receiveValue: { [weak self] value in
            self?.showContent.text = value
        }.store(in: &cancellable)
    }
}


class ThirdPartyLibrary {
    func performAsyncAction(completionHandler: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler()
        }
    }
    
    func performAsyncActionFuture() -> Future <Void, Never> {
        return Future() { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                promise(Result.success(()))
            }
        }
    }
    
    func performAsyncActionFutureError() -> Future <String, AysncError> {
        return Future() { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                promise(Result.failure(AysncError.message("Request Failed!")))
                promise(Result.success("aman event got completed successfully"))
            }
        }
    }
}

enum AysncError: Error {
    case message(String)
}
