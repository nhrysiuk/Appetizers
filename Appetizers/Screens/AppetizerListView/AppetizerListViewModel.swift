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
    @Published var isLoading = false
    @Published var alertIsPresented = false
    
    func getAppetizers() {
        isLoading = true
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                alertItem = AlertContext.invalidResponse
                alertIsPresented = true
            }
        }
    }
}

