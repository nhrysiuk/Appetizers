//
//  AppetizerView.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            AppetizerImage(URLString: appetizer.imageURL)
                .overlay(alignment: .topTrailing) {
                    Button {
                        
                    } label: {
                        Text("X")
                            .foregroundStyle(.black)
                            .frame(width: 30, height: 30)
                            .background(.white)
                            .clipShape(Circle())
                            .padding(10)
                    }
                }
            
            Text(appetizer.name)
                .font(.title)
                .fontWeight(.medium)
                .padding(.horizontal, 20)
            Text(appetizer.description)
                .font(.title3)
                .padding(20)
            
            HStack(spacing: 35) {
                    NutrientView(name: "Calories", quantity: String(appetizer.calories))
                    NutrientView(name: "Carbs", quantity: "\(appetizer.carbs) g")
                    NutrientView(name: "Protein", quantity: "\(appetizer.protein) g")
            }
            .padding(.bottom, 40)
            
            OrderButton(text: "$\(appetizer.price) - Add To Order")
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
        }
    }
}

struct NutrientView: View {
    
    var name: String
    var quantity: String
    
    var body: some View {
        VStack {
            Text(name)
                .fontWeight(.medium)
                .padding(.bottom, 3)
            Text(String(quantity))
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.secondary)
                .italic()
        
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.appetizer)
}
