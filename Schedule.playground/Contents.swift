func computeLCM(_ inputArray: [Int]) -> Int {
    let inputArrayCount = inputArray.count
    
    var initialAns = inputArray[0]
    for iter in 1..<inputArrayCount {
        initialAns = lcm(initialAns, inputArray[iter])
    }
        
    return initialAns
}

func lcm(_ first: Int, _ second: Int) -> Int {
    if first%second == 0 {
        return second
    }
    
    return lcm(second, first%second)
}

var alerts = ["Alert1", "Alert2", "Alert3", "Alert4", "Alert5"]

var timings = [5, 15, 5, 25, 60] // in minutes

var lcmValue = computeLCM(timings)

var timingsCount = timings.count

var currentTime = 1

while true {
    for iteration in 0..<timingsCount {
        if currentTime%timings[iteration] == 0 {
            print("\(alerts[iteration]) timing is: \(currentTime)")
        }
    }

    currentTime = currentTime + lcmValue
}

