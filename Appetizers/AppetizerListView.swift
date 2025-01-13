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
        NavigationView {
            List(viewModel.appetizers) { appetizer in
                AppetizerView(appetizer: appetizer)
            }
            .navigationTitle("🥗 Appetizers")
        }
        .onAppear() { viewModel.getAppetizers() }
    }
}

#Preview {
    AppetizerListView()
}
