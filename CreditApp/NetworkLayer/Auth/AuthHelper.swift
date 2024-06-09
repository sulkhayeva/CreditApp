//
//  AuthHelper.swift
//  CreditApp
//
//  Created by Gumru on 5/30/24.
//

import Foundation
enum AuthHelper: String {
    case login = "user/login"
    case registr = "user/register"

    var path: String {
        return NetworkHelper.shared.requestURL(url: self.rawValue)
    }
}
