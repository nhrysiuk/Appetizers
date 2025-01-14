//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.appetizers) { appetizer in
                       AppetizerView(appetizer: appetizer)
                            .onTapGesture {
                                viewModel.chosenAppetizer = appetizer
                                viewModel.isShowingDetail = true
                            }
                    }
                }
                .padding()
                .onAppear() { viewModel.getAppetizers() }
                
                .alert(
                    viewModel.alertItem?.title ?? "Error",
                    isPresented: $viewModel.alertIsPresented
                ) {
                } message: {
                    Text(
                        viewModel.alertItem?.message ?? ""
                    )
                }
            }
            .blur(radius: viewModel.isShowingDetail ? 10 : 0)
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.chosenAppetizer!)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .padding(.horizontal, 30)
                    .padding(.vertical, 100)
                    .shadow(radius: 15)
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .tint(.brandPrimary)
            }
        }
        
    }
}
#Preview {
    AppetizerListView()
}
