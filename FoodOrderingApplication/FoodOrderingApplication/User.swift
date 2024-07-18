//
//  User.swift
//  FoodOrderingApplication
//
//  Created by Vesta Elder Care on 12/06/24.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false  
}
