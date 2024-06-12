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
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Email ", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(false)
                    DatePicker("Birthday", selection: $viewModel.birthdate, displayedComponents: .date)
                    
                    
                    Button {
                        print("Save")
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.extraNapkins)
                    
                    
                    Toggle("Frequent Refills", isOn: $viewModel.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("Account")
        }
    }
}

#Preview {
    AccountView()
}
 
