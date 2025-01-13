//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import Foundation

@MainActor class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    
    func getAppetizers() {
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
            } catch {
                alertItem = AlertContext.invalidResponse
            }
        }
    }
}

