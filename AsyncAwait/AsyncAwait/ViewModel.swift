//
//  ViewModel.swift
//  AsyncAwait
//
//  Created by aman on 07/09/24.
//

import Foundation

protocol UserServices {
    func reloadData()
}

class ViewModel {
    var users: [UserModel] = [] {
        didSet {
            self.userDelegate?.reloadData()
        }
    }
    
    var userDelegate: UserServices?
    private let manager = APIManager()
    
    
    // one can also use @MainActor func fetchUsers to avoid using DispatchQueue.main.async {} in tableView.reloadData(). @MainActor will execute the function on the main thread...
    func fetchUsers() {
        //        manager.fetchUsers(modelType: [UserModel].self) { result in
        //            switch result {
        //            case .success(let value):
        //                self.users = value
        //
        //            case .failure(let error):
        //                print(error)
        //            }
        //        }
        Task {
            do {
                let information: [UserModel] = try await manager.request(url: userUrl)
                self.users = information
            } catch (let error) {
                print(error)
            }
        }
    }
}
