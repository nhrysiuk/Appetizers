//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 15.01.2025.
//

import SwiftUI

class AccountViewModel: ObservableObject {
    
    @Published var firstName = String()
    @Published var lastName = String()
    @Published var emailString = String()
    @Published var birthDate = Date()
    @Published var needsExtraNapkins = Bool()
    @Published var needsFrequentRefills = Bool()
    
    @Published var alertIsPresented = Bool()
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !emailString.isEmpty else {
            alertItem = AlertContext.invalidForm
            alertIsPresented = true
            
            return false
        }

        guard emailString.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            alertIsPresented = true

            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else {
            return
        }
        
        
    }
}
