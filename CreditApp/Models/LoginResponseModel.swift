//
//  LoginResponseModel.swift
//  CreditApp
//
//  Created by Gumru on 5/30/24.
//

import Foundation

struct LoginResponseModel: Codable {
    let data: [LoginResponseM]?
    let text, status: String?
}

// MARK: - Datum
struct LoginResponseM: Codable {
    let id, username: String?
    let password: String?
    let roleName, branchName, companyName, registrationDate: String?
    let surname, eName, isActive: String?
    let note: String?
    let email, token: String?

    enum CodingKeys: String, CodingKey {
        case id, username, password
        case roleName = "role_name"
        case branchName = "branch_name"
        case companyName = "company_name"
        case registrationDate = "registration_date"
        case surname
        case eName = "e_name"
        case isActive = "is_active"
        case note, email, token
    }
}
