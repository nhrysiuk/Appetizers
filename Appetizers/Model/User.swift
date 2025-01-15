//
//  User.swift
//  Appetizers
//
//  Created by Анастасія Грисюк on 15.01.2025.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var needsExtraNapkins = false
    var needsFrequentRefills = false
}
