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
            
            VStack(alignment: .leading) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    AppetizerView(appetizer: MockData.appetizer)
}
