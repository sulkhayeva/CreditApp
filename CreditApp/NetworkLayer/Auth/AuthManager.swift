//
//  AuthManager.swift
//  CreditApp
//
//  Created by Gumru on 5/30/24.
//

import Foundation

class AuthManager{
    
    static let shared = AuthManager()
    
    func sendLoginRequest (
        body: [String: Any],
        complete: @escaping((LoginResponseModel?, String?) -> Void)) {
            
        NetworkManager.shared.request(
            type: LoginResponseModel.self,
            url: AuthHelper.login.path,
            header: NetworkHelper.shared.getHeader(),
            body: body,
            method: .post) { response in
                switch response {
                case .success(let data):
                    complete(data, nil)
                case .failure(let error):
                    complete(nil,error.rawValue )
                }
            }
    }
    
    func sendRegisterRequest (
        body: [String: Any],
        complete: @escaping((RegisterResponseModel?, String?) -> Void)) {
        //let url = NetworkHelper.shared.requestURL(url: "user/register")
        
            NetworkManager.shared.request(
                type: RegisterResponseModel.self,
                url: AuthHelper.registr.path,
                header: NetworkHelper.shared.getHeader(),
                body: body,
                method: .post) { response in
                switch response {
                case .success(let data):
                    complete(data, nil)
                case .failure(let error):
                    complete(nil,error.rawValue )
                }
            }
    }
}
