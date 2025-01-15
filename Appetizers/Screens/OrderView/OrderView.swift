//
//  OrderView.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import SwiftUI

struct OrderView: View {
    
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(MockData.appetizers) { appetizer in
                    AppetizerView(appetizer: appetizer)
                }
                .onDelete(perform: deleteAppetizer)
                .padding(.horizontal)
            }
            .navigationTitle("🧾 Orders")
            Button {
                
            } label: {
                OrderButton(text: "$500 – Pay")
            }
            .padding()
        }
    }
    
    func deleteAppetizer(at offsets: IndexSet) {
        
    }
}

#Preview {
    OrderView()
}
