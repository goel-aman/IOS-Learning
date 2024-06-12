//
//  AccountViewModel.swift
//  FoodOrderingApplication
//
//  Created by Vesta Elder Care on 12/06/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    @Published var alertItem: AlertItem? 
    
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else  {
            alertItem = AlertContext
            return false
        }
        
        guard email.isValidEmail else {
            return false
        }
        
        return true
    }
}


 
