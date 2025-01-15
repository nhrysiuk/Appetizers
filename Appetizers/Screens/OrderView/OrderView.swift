//
//  OrderView.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import SwiftUI

struct OrderView: View {
    
    @State var ordersList = MockData.appetizers
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(ordersList) { appetizer in
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
                
                if ordersList.isEmpty {
                    EmptyAppetizersList()
                }
            }
        }
    }
    
    func deleteAppetizer(at offsets: IndexSet) {
        ordersList.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
