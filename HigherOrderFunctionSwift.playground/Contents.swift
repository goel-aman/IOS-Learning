//
//Given an integer array A of size N.
//You have to pick exactly B elements from either left or right end of the array A to get maximum sum.
//Find and return this maximum possible sum.
//
//Sample Input:
// A = [5, -2, 3 , 1, 2]
// B = 3
//
//Sample Output:
//8


var arrayA = [5, -2, 3, 1, 2]
var valueB = 3

var arrayACount = arrayA.count

var startIndex = arrayACount - valueB
var endIndex = arrayACount

var numberOfIterations = valueB + 1
var maxValue = Int.min

var initialSum = 0

for iter in startIndex..<endIndex {
    initialSum += arrayA[iter]
}


maxValue = max(maxValue, initialSum)

for iter in 0..<(numberOfIterations - 1) {
    initialSum -= arrayA[startIndex%arrayACount]
    startIndex = (startIndex + 1)
    
    initialSum += arrayA[endIndex%arrayACount]
    endIndex = endIndex + 1
    
    maxValue = max(maxValue, initialSum)
}

print(maxValue)
