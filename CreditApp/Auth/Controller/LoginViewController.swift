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
        let redValue: CGFloat = 178.0 / 255.0
        let greenValue: CGFloat = 89.0 / 255.0
        let blueValue: CGFloat = 45.0 / 255.0
        let borderColorField = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        usernameField.layer.borderWidth = 1.0
        usernameField.layer.borderColor = UIColor(named: "bordorColor")?.cgColor
        usernameField.layer.cornerRadius = 6
        passwordField.layer.borderWidth = 1.0
        passwordField.layer.borderColor = borderColorField.cgColor
        passwordField.layer.cornerRadius = 6
        
        let redColor: CGFloat = 32.0 / 255.0
        let greenColor: CGFloat = 49.0 / 255.0
        let blueColor: CGFloat = 96.0 / 255.0
        let borderColorButton = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
        
        signIn.layer.cornerRadius = 6
        signUp.layer.cornerRadius = 6
        signUp.layer.borderWidth = 1.0
        signUp.layer.borderColor = borderColorButton.cgColor
        
    }

    fileprivate func signUpButtonClicked(){
        let vc = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegisterController") as? RegisterController ?? RegisterController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

