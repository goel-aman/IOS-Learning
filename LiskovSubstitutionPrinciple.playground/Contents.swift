import Foundation

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class TicketBookingSystem {
    private var availableSeats: Int
    
    init(totalSeats: Int) {
        self.availableSeats = totalSeats
    }
    
    func bookingSuccessFromServer() {
        sleep(1)
    }
    
    func bookTicket(customerID: Int) {
        if self.availableSeats > 0 {
            bookingSuccessFromServer()
            self.availableSeats -= 1
            print("Customer \(customerID) successfully booked a ticket. Seats left: \(self.availableSeats)")
        } else {
            print("Customer \(customerID) could not book a ticket. No seats left.")
        }
    }
}

// Simulation of concurrent ticket bookings
let ticketBookingSystem = TicketBookingSystem(totalSeats: 10)

let dispatchQueue = DispatchQueue(label: "aman", attributes: .concurrent)

for i in 1...100 {
    dispatchQueue.async {
        ticketBookingSystem.bookTicket(customerID: i)
    }
}

