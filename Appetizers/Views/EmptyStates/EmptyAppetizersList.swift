//
//  EmptyAppetizersList.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 15.01.2025.
//

import SwiftUI

struct EmptyAppetizersList: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
            
            VStack {
                Image("EmptyList")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Text("You have no items in your order.")
            }
            .padding()
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyAppetizersList()
}
