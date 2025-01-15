//
//  CloseButton.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 15.01.2025.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        Text("X")
            .foregroundStyle(.black)
            .frame(width: 30, height: 30)
            .background(.white)
            .clipShape(Circle())
            .padding(10)
    }
}

#Preview {
    XDismissButton()
}
