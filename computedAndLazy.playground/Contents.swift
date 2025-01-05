import UIKit

var greeting = "Hello, playground"
class Values {
    var a = 5
    var b = 7
    
    var c: Int {
        return a * b
    }
    
    lazy var d: Int = {
        return a * b
    }()
}

var valuesObject = 
a = 2
b = 3

print(c)
print(d)
