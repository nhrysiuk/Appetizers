//
//  OrderView.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerView(appetizer: appetizer)
                        }
                        .onDelete(perform: order.delete(at:))
                        .padding(.horizontal)
                    }
                    .navigationTitle("🧾 Orders")
                    Button {
                        
                    } label: {
                        Text("$\(order.totalPrice) – Place Order")
                            .modifier(StandardButtonStyle())
                    }
                    .padding()
                }
                
                if order.items.isEmpty {
                    EmptyAppetizersList()
                }
            }
        }
    }
}

#Preview {
    OrderView()
}
