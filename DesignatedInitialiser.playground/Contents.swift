import UIKit

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    required init(name: String, value: String) {
        self.name = "unknown"
        print("inside person class")
    }
}

class Citizen: Person {
    var nationality: String
    
    init(name: String, nationality: String) {
        self.nationality = nationality
        super.init(name: name)
    }
    
    required init(name: String, value: String) {
        self.nationality = value
        super.init(name: name)
    }
}


var citizenObject = Citizen(name: "mohan", value: "24")
print(citizenObject.name)

