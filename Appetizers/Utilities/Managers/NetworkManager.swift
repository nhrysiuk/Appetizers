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
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
              print("Network failed, fallback to local dataset.")
              if let fallbackData = self.getAppetizersFallback() {
                  print("Fallback data fetched successfully.")
                  return fallbackData
              } else {
                  return []
              }
          }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).request
        } catch {
            print(error)
            throw APIError.invalidData
        }
    }
    
    func getAppetizersFallback() -> [Appetizer]? {
        guard let url = Bundle.main.url(forResource: "appetizer-data", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return nil
        }
        return try? JSONDecoder().decode([Appetizer].self, from: data)
    }
}
