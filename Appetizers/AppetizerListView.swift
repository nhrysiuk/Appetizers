//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.appetizers) { appetizer in
                AppetizerView(appetizer: appetizer)
            }
            .navigationTitle("🥗 Appetizers")
        }
    }
}

#Preview {
    AppetizerListView()
}
