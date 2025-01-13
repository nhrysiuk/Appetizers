//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import Foundation

@MainActor class AppetizerListViewModel: ObservableObject {
    @Published var  appetizers: [Appetizer] = []
    
    func getAppetizers() {
        Task {
            appetizers = try await NetworkManager.shared.getAppetizers()
        }
    }
}

