

func isNumber(_ input: String) -> Bool {
    let inputLength = input.count
    
    if inputLength == 0 {
        return false
    }
        
    let inputArray = Array(input).map { String($0) }
    
    for iter in 0..<inputLength {
        if inputArray[iter] >= "0" && inputArray[iter] <= "9" {
            continue
        } else {
            return false
        }
    }
    
    return true
}

// Find the product of odd items
let numbers: [Int?: [String?]?] = [1: ["1", "20"], 10: ["15B","2"], 5: [nil], nil: nil, 3: ["apple", "ball", "3", "2"]]

let keys = Array(numbers.keys)
let keysLength = keys.count

var product = 1

for iter in 0..<keysLength {
    if let key = keys[iter] {
        if key%2 != 0 {
            product = product * key
        }
    }
}

let values = Array(numbers.values)
let valuesLength = values.count

for iter in 0..<valuesLength {
    if let valuesArray = values[iter] {
        let valuesArrayCount = valuesArray.count
        for index in 0..<valuesArrayCount {
            if let value = valuesArray[index] {
                if isNumber(value) {
                    if let number = Int(value) {
                        if number%2 != 0 {
                            product = product * number
                        }
                    }
                }
            }
        }
    }
}



print(product)
