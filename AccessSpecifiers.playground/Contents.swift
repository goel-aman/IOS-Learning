import UIKit

var greeting = "Hello, playground"

class Candies {
    private var name = "aman goel"
    
    func printName() {
        print("name is: \(name)")
    }
}

extension Candies {
    private func setName() {
        self.name = "rahul"
    }
}

var chocolate = Candies()

chocolate.setName()
print(chocolate.printName())

class Coke {
    var objectCandies = Candies()
    
    func changeName(inputValue: String) {
        objectCandies.name = "5"
    }
}
