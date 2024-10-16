import UIKit

protocol Car {
    associatedtype Identifier
    
    var id: Identifier { get }
}

struct BMW: Car {
    typealias Identifier = String
    
    var id: String
    
    init(id: String) {
        self.id = id
    }
}

struct Honda: Car {
    typealias Identifier = Int
    
    var id: Int

    init(id: Int) {
        self.id = id
    }
}

var isBMW = true

func getFavoriteCar() -> any Car {
    return isBMW ? BMW(id: "bmw"): Honda(id: 1234)
}

print(String(describing: getFavoriteCar()))

