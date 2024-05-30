//
//  LoginRequestModel.swift
//  CreditApp
//
//  Created by Gumru on 5/30/24.
//

import Foundation

struct LoginRequestModel: Codable {
    let username, password, hostname: String?
}
