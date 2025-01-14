//
//  AppetizerImage.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import SwiftUI

struct AppetizerImage: View {
    
    let URLString: String
    
    var body: some View {
        AsyncImage(url: URL(string: URLString)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //.clipShape(RoundedRectangle(cornerRadius: 8))
                
            case .failure(_):
                Image(systemName: "photo")
                    .foregroundStyle(.secondary)
                    .font(.system(size: 30))
                
            @unknown default:
                Image(systemName: "photo")
                    .foregroundStyle(.secondary)
                    .font(.system(size: 30))
            }
        }
        .aspectRatio(contentMode: .fit)
       // .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    AppetizerImage(URLString: "https://static.vecteezy.com/vite/assets/photo-masthead-375-BoK_p8LG.webp")
}
