//
//  AccountView.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 13.01.2025.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                    
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthdate,
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
                    Toggle("Extra Napkins", isOn: $viewModel.user.needsExtraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.needsFrequentRefills)
                }
            }
            .navigationTitle("👤 Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button {
                        focusedTextField = nil
                    } label: {
                        Text("Dismiss")
                    }
                }
            }
        }
        .onAppear {
            viewModel.retrieveUser()
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
