//
//  ViewController.swift
//  CreditApp
//
//  Created by Gumru on 4/24/24.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet private weak var usernameField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var signIn: UIButton!
    @IBOutlet private weak var signUp: UIButton!

    @IBAction func signInAction(_ sender: UIButton){
        signInClicked()
    }
    
    @IBAction func signUpAction(_ sender: UIButton){
        signUpButtonClicked()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        usernameField.delegate = self
        passwordField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    fileprivate func configureDesign(){
        usernameField.layer.borderWidth = 1.0
        usernameField.layer.borderColor = UIColor(named: "usernameBorder")?.cgColor
        usernameField.layer.cornerRadius = 6
        passwordField.layer.borderWidth = 1.0
        passwordField.layer.borderColor = UIColor(named: "usernameBorder")?.cgColor
        passwordField.layer.cornerRadius = 6
        
        signIn.layer.cornerRadius = 6
        signUp.layer.cornerRadius = 6
        signUp.layer.borderWidth = 1.0
        signUp.layer.borderColor = UIColor(named: "signUpBorder")?.cgColor
        
    }
    
    fileprivate func signInClicked(){
        guard let username = usernameField.text,
              let pass = passwordField.text else {return}
        if username.count > 0 && username.count < 7 || pass.count > 0 && pass.count < 7 {
            showMessage("Username və password simvol sayı 7 olmalıdır!")
        } 
        
        else if username.count == 0 || pass.count == 0 {
            showMessage("Məlumatları daxil edin!")
        }
        
        else {
            checkUser(username: username, pass: pass)
        }
    }
    
    fileprivate func checkUser(username: String, pass: String){ //bura elaveler olunacaq
        
    }
    
   

    fileprivate func signUpButtonClicked(){
        let vc = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegisterController") as? RegisterController ?? RegisterController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
extension UIViewController {
    func showMessage(_ message: String) {
        let alertController = UIAlertController(title: message, message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alertController.view.tintColor = UIColor.systemIndigo
        present(alertController, animated: true, completion: nil)
    }
}
extension LoginViewController: UITextFieldDelegate{
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            guard let text = textField.text else {return}
            switch textField {
            case usernameField:
                usernameField.layer.borderColor = text.count > 7 ? UIColor(named: "usernameBorder")?.cgColor : UIColor.red.cgColor
                usernameField.layer.borderWidth = text.count > 7 ? 1.0 : 2.0
                break
            case passwordField:
                passwordField.layer.borderColor = text.count > 7 ? UIColor(named: "usernameBorder")?.cgColor : UIColor.red.cgColor
                passwordField.layer.borderWidth = text.count > 7 ? 1.0 : 2.0
                break
            default: break
            }
        }
}

