//
//  AccountView.swift
//  FoodOrderingApplication
//
//  Created by aman on 02/06/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()

    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email ", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(false)
                    DatePicker("Birthday", selection: $birthdate, displayedComponents: .date)
                    
                    Button {
                        print("Save")
                    } label: {
                        Text("Save Changes")
                    }
                    
                }
                
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $extraNapkins)
                    
                    Toggle("Refills", isOn: $frequentRefills)
                        
                }
                // since the toggle was required on both the toggle option
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("Account")
        }
    }
}

#Preview {
    AccountView()
}
