//
//  StringExtension.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 15.01.2025.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
}
