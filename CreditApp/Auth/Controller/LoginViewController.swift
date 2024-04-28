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
        
    }
    
    @IBAction func signUpAction(_ sender: UIButton){
        signUpButtonClicked()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
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

    fileprivate func signUpButtonClicked(){
        let vc = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegisterController") as? RegisterController ?? RegisterController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

