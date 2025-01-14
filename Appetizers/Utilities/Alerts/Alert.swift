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
    static let invalidData = AlertItem(title: "Server error",
                                       message: "The data received from the server was invalid. Please contact support",
                                       dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: "Server error",
                                           message: "Invalid response from the server. Please contact support",
                                           dismissButton: .default(Text("OK")))
}
