//
//  User.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 15.01.2025.
//

import Foundation

final class Order: ObservableObject {
    
    @Published var items = [Appetizer]()
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
