//
//  Flights.swift
//  ActorsInSwift
//
//  Created by aman on 31/08/24.
//

import Foundation

class Flight {
    let company = "Vistara"
    
    var availableSeats: [String] = ["1A", "1B", "1C"]
    
    func getAvailableSeats() -> [String] {
        return availableSeats
    }
    
    func bookSeats() -> String {
        let bookedSeat = availableSeats.first ?? ""
        availableSeats.removeFirst()
        return bookedSeat
    }
}
