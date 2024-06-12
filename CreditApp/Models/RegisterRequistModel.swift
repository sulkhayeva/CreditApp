//
//  RegisterRequistModel.swift
//  CreditApp
//
//  Created by Gumru on 6/10/24.
//

import Foundation

struct RegisterRequistModel: Codable {
    let name, surname, fatherName, identityPin: String?
    let username, password, email: String?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case surname = "Surname"
        case fatherName = "FatherName"
        case identityPin = "IdentityPin"
        case username = "Username"
        case password = "Password"
        case email = "Email"
    }
}
