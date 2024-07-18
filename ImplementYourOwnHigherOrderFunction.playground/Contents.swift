import UIKit

func computeMap(_ inputArray: [Int], completion: (Int) -> (Int)) -> [Int] {
    var changedArray = [Int]()

    var inputArrayCount = inputArray.count
    
    for iter in 0..<inputArrayCount {
        changedArray.append(completion(inputArray[iter]))
    }
    return changedArray
}

var inputArray = [2, 3, 5]

print(computeMap(inputArray) { value in
    2 * value
})



