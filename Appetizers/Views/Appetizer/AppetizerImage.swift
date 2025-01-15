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
                    .padding(.horizontal)
                
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                
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
    }
}

#Preview {
    AppetizerImage(URLString: "https://media.istockphoto.com/id/470751037/photo/straight-asphalt-road-leading-into-sunlight.jpg?s=612x612&w=0&k=20&c=jmxixH3uIH1cR8sqYuZJRcIHHLoIZDvQkJc_FdPIGR0=")
}
