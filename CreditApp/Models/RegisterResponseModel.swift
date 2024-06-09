//
//  RegisterResponseModel.swift
//  CreditApp
//
//  Created by Gumru on 5/31/24.
//

import Foundation

struct RegisterResponseModel: Codable {
    let data: [RegisterResponseM]?
    let text, status: String?
}

// MARK: - Datum
struct RegisterResponseM: Codable {
    let id, username: String?
    let password, roleName: String?
    let branchName: String?
    let companyName: String?
    let registrationDate, surname, eName, isActive: String?
    let note: String?
    let email: String?
    let token: String?

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

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}
