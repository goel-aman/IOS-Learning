//
//  NetworkManager.swift
//  upStock
//
//  Created by aman on 23/12/24.
//

import Foundation

class NetworkManager {
    
    var personclass: PersonClass?
    
    init(personclass: PersonClass?) {
        self.personclass = personclass
    }
    
}

class PersonClass {
    var networkClass: NetworkManager?

    init(networkClass: NetworkManager?) {
        self.networkClass = networkClass
    }
}


var networkObject = NetworkManager(personclass: nil)

var personObject = PersonClass(networkClass: networkObject)

networkObject.personclass = personObject


personObject = nil


let dispatchGroup = DispatchGroup()


dispatchgroup.enter
// newtowrk {


dispatchgorup.leave
    
}


class Counter {
    var count: Int
    var queue = DispatchQueue(label: "aman", attributes: .concurrent)
    
    
    init(count: Int = 0) {
        self.count = count
    }
    
    
    func enter() {
        queue.async() {
            self.count = self.count + 1
        }
        
    }
    
    func leave() {
        count = count - 1
    }
    
    func notify() {
     //
    }
}
