//
//  AccountView.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Email", text: $viewModel.emailString)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $viewModel.birthDate,
                               displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                } header: {
                    Text("PERSONAL INFORMATION")
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.needsExtraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.needsFrequentRefills)
                }
            }
            .navigationTitle("👤 Account")
        }
        .alert(
            viewModel.alertItem?.title ?? "аа",
            isPresented: $viewModel.alertIsPresented
        ) {
        } message: {
            Text(viewModel.alertItem?.message ?? "аа")
        }
    }
}


#Preview {
    AccountView()
}
