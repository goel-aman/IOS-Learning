import UIKit

var dictionary: [Int: [String]] = [1: ["Aman", "Rahul", "Mohan"], 2: ["Maggie", "Pasta", "Chowmein"], 3: ["Pasta", "Tomato Ketchup"]]


var values = dictionary.flatMap { $0.value }


print(values)
