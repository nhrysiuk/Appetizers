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

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let appetizer = Appetizer(id: 1,
                                     name: "Name",
                                     description: "Description",
                                     price: 100,
                                     imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
                                     protein: 10,
                                     calories: 100,
                                     carbs: 100)
    
    static let appetizers = Array<Appetizer>(repeating: appetizer, count: 10)
}
