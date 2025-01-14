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
            NavigationStack {
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(viewModel.appetizers) { appetizer in
                            AppetizerView(appetizer: appetizer)
                                .padding(.horizontal)
                                .onTapGesture {
                                    viewModel.chosenAppetizer = appetizer
                                    viewModel.isShowingDetail = true
                                }
                        }
                    }
                    .navigationTitle("🥗 Appetizers")
                }
            }
            .padding(.top, 0.2)
            .blur(radius: viewModel.isShowingDetail ? 3 : 0)
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.chosenAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .padding(.horizontal)
                    .shadow(radius: 15)
            }
        }
        .onAppear() { viewModel.getAppetizers() }
        .transition(.opacity)
        .animation(.easeInOut(duration: 0.25), value: viewModel.isShowingDetail)
        .alert(
            viewModel.alertItem?.title ?? "Error",
            isPresented: $viewModel.alertIsPresented
        ) {
        } message: {
            Text(viewModel.alertItem?.message ?? "")
        }
        
        if viewModel.isLoading {
            ProgressView()
                .tint(.brandPrimary)
        }
    }
}

#Preview {
    AppetizerListView()
}
