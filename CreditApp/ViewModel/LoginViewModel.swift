//
//  LoginViewModel.swift
//  CreditApp
//
//  Created by Gumru on 6/9/24.
//

import Foundation
import UIKit

class LoginViewModel {
    private (set) var userModel: LoginResponseM?
    var successCalback: (()->Void)?
    var errorCallback: ((String)->Void)?
    
//    func openHome(){
//        let homeVC = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController ?? HomeViewController()
//    }
    
    func sendLoginRequest(userName: String, password: String) {
        let body: [String: Any] = [
            "username": userName,
            "password": password,
            "hostname": "iOS_app"
        ]
        AuthManager.shared.sendLoginRequest(body: body) { [weak self] response, error in
            guard let self = self else {return}
            if let errorString = error {
                self.errorCallback?(errorString)
            }
            else if let data = response?.data {
                userModel = data.first //APIda array oldugu ucun first yaziriq
                let successSave = KeychainManager.shared.save(key: "TOKEN", value: userModel?.token ?? "")
                print("Save successful: \(successSave)")
                self.successCalback?()
                
            }
            else {
                self.errorCallback?(response?.text ?? "") //ne xeta,ne de veri yoxdursa(200 qaytarir yoxsa)
            }
        }
    }
    
    deinit{
        print("*****", #function, String(describing: type(of: self)))
    }
}
