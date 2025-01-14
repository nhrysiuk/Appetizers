//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerView(appetizer: appetizer)
                }
                .navigationTitle("🥗 Appetizers")
            }
            .onAppear() { viewModel.getAppetizers() }
            .alert(viewModel.alertItem?.title ?? "Error", isPresented: $viewModel.alertIsPresented) {
                
            } message: {
                Text(viewModel.alertItem?.message ?? "")
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .tint(.brandPrimary)
            }
        }
    }
}

#Preview {
    AppetizerListView()
}
