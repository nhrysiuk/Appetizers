//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import Foundation

class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var alertIsPresented = false
    @Published var isShowingDetail = false
    @Published var chosenAppetizer: Appetizer?
    
    @MainActor func getAppetizers() {
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

