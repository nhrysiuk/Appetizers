//
//  Appetizer.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let protein: Int
    let calories: Int
    let carbs: Int
}

struct AppetizereResponse {
    let request: [Appetizer]
}

struct MockData {
    
    static let appetizer = Appetizer(id: 1,
                                     name: "Appetizer 1",
                                     description: "Description 1",
                                     price: 100,
                                     imageURL: "imageURL",
                                     protein: 10,
                                     calories: 100,
                                     carbs: 100)
    
    static let appetizers = Array<Appetizer>(repeating: appetizer, count: 10)
}
