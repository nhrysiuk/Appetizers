//
//  OrderButton.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 14.01.2025.
//

import SwiftUI

struct OrderButton: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .foregroundStyle(.white)
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.accent)
            
            .cornerRadius(10)
    }
}

#Preview {
    OrderButton(text: "$10.00 - Add To Order")
}
