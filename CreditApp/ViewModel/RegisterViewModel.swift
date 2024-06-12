//
//  RegisterViewModel.swift
//  CreditApp
//
//  Created by Gumru on 6/10/24.
//

import Foundation

class RegisterViewModel {
    private (set) var userModel: RegisterResponseM?
    var successCalback: (()->Void)?
    var errorCallback: ((String)->Void)?
    
    func sendRegisterRequest(userName: String, password: String, email: String, name: String, surname: String, fatherName: String, identityPin: String) {
        let body: [String: Any] = [
            "Name": name,
            "Surname": surname,
            "FatherName": fatherName,
            "IdentityPin": identityPin,
            "Username": userName,
            "Password": password,
            "Email": email
        ]
        AuthManager.shared.sendRegisterRequest(body: body) { [weak self] response, error in
            guard let self = self else {return}
            if let errorString = error {
                self.errorCallback?(errorString)
            }
            else if let data = response?.data {
                userModel = data.first
                let successSave = KeychainManager.shared.save(key: "TOKEN", value: userModel?.token ?? "")
                print("Save successful: \(successSave)")
                self.successCalback?()
                
            }
            else {
                self.errorCallback?(response?.text ?? "")
            }
        }
    }
    
    deinit{
        print("*****", #function, String(describing: type(of: self)))
    }
}
