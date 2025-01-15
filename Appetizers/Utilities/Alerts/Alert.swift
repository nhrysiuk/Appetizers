//
//  Alert.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: - Network Alerts
    static let invalidData = AlertItem(title: "Server error",
                                       message: "The data received from the server was invalid. Please contact support",
                                       dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: "Server error",
                                           message: "Invalid response from the server. Please contact support",
                                           dismissButton: .default(Text("OK")))
    
    //MARK: - Account Alerts
    static let invalidForm = AlertItem(title: "Invalid Form",
                                       message: "Please ensure all fields in the form have been filled out.",
                                       dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: "Invalid Email",
                                        message: "Please ensure your email is correct.",
                                        dismissButton: .default(Text("OK"))
    )
    
    static let userSaveSuccess = AlertItem(title: "Profile Saved",
                                           message: "Your profile information was successfully saved.",
                                           dismissButton: .default(Text("OK"))
    )
    
    static let invalidUserData = AlertItem(title: "Profile Error",
                                           message: "There was an error saving or retrieving your profile.",
                                           dismissButton: .default(Text("OK"))
    )
}
