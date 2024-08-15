import UIKit
import Combine

var cancellable: AnyCancellable!

let dictionary: [Int: String] = [1: "One", 2: "Two", 3: "Three", 5: "Five"]

let number = (0...5)

number.publisher
    .compactMap({ number -> String? in
        return dictionary[number]
    })
    .sink { numberKey in
        print(numberKey)
    }
