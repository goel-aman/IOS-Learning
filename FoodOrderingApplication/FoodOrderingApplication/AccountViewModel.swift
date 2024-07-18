//
//  AccountViewModel.swift
//  FoodOrderingApplication
//
//  Created by aman on 12/06/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published private var firstName = ""
    @Published private var lastName = ""
    @Published private var email = ""
    @Published private var birthdate = Date()
    @Published private var extraNapkins = false
    @Published private var frequentRefills = false
}


