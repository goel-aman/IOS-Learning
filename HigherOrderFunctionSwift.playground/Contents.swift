import Foundation

struct IndieApp {
    let name: String
    let monthlyPrice: Double
    let users: Int
}


let appPortfolio = [IndieApp(name: "Creator View", monthlyPrice: 0.00, users: 4356),
                    IndieApp(name: "FitHero", monthlyPrice: 11.99, users: 1756),
                    IndieApp(name: "Buckets", monthlyPrice: 3.99, users: 7598),
                    IndieApp(name: "Connect Four", monthlyPrice: 1.99, users: 34081)]

// Filter....
let freeApps = appPortfolio.filter { $0.monthlyPrice == 0.00 }
print("freeApps array is: \(freeApps)")


// Map...
let appNames = appPortfolio.map {
    $0.name
}

print("app name is: \(appNames)")



let number = [3, 9, 5, 12, 18]
let sum = number.reduce(5, +)

print(sum)
