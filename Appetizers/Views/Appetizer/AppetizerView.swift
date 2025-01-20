//
//  AppetizerView.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import SwiftUI

struct AppetizerView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerImage(URLString: appetizer.imageURL)
                .frame(width: 90, height: 90)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.trailing, 5)
            
            VStack(alignment: .leading) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            Spacer()
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    AppetizerView(appetizer: MockData.appetizer)
}
