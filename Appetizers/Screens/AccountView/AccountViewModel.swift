//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 15.01.2025.
//

import SwiftUI

class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    
    @Published var alertIsPresented = Bool()
    @Published var alertItem: AlertItem?
    
    func retrieveUser() {
        guard let data = userData else { return }
        do {
            user = try JSONDecoder().decode(User.self, from: data)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
            alertIsPresented = true
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            alertIsPresented = true
            
            return false
        }

        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            alertIsPresented = true

            return false
        }
        
        return true
    }
}
