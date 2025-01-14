//
//  AppetizerView.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerImage(URLString: "https://media.istockphoto.com/id/470751037/photo/straight-asphalt-road-leading-into-sunlight.jpg?s=612x612&w=0&k=20&c=jmxixH3uIH1cR8sqYuZJRcIHHLoIZDvQkJc_FdPIGR0=")
                .frame(maxHeight: 300)
                .clipped()
                .overlay(alignment: .topTrailing) {
                    Button {
                        isShowingDetail = false
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
                .padding(.vertical, 10)
            Text(appetizer.description)
                .font(.title3)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            
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
        .background(.white)
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
    AppetizerDetailView(appetizer: MockData.appetizer, isShowingDetail: Binding.constant(true))
}
