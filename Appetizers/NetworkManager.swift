//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers() async throws -> [Appetizer] {
            guard let url = URL(string: appetizerURL) else {
                print("Invalid URL")
                return []
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(AppetizerResponse.self, from: data).request
            } catch {
                print(error)
                return []
            }
        
        }
}
