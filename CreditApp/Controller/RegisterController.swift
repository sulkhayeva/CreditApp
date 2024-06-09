//
//  RegisterController.swift
//  CreditApp
//
//  Created by Gumru on 4/24/24.
//

import UIKit

class RegisterController: UIViewController {
    
    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet private weak var surnameField: UITextField!
    @IBOutlet private weak var fathersName: UITextField!
    @IBOutlet private weak var identification: UITextField!
    @IBOutlet private weak var usernameTextfield: UITextField!
    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var emailTextfield: UITextField!
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var registerLabel: UILabel!
    
    @IBAction func signUpActionRegister(_ sender: UIButton){
        signUpClicked()
    }
    
    @IBAction func backAction(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        registerDelegate()
        navigationController?
            .setNavigationBarHidden(true, animated: true) //default backi gorunmez edir
        
        // Do any additional setup after loading the view.
    }
    
    fileprivate func registerDelegate(){
        nameField.delegate = self
        surnameField.delegate = self
        fathersName.delegate = self
        identification.delegate = self
        emailTextfield.delegate = self
        usernameTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    
    fileprivate func configureDesign(){
        nameField.layer.cornerRadius = 6
        nameField.layer.borderWidth = 1.0
        nameField.layer.borderColor = UIColor(named: "signUpBorder")?.cgColor
        
        surnameField.layer.cornerRadius = 6
        surnameField.layer.borderWidth = 1.0
        surnameField.layer.borderColor = UIColor(named: "signUpBorder")?.cgColor
        
        fathersName.layer.cornerRadius = 6
        fathersName.layer.borderWidth = 1.0
        fathersName.layer.borderColor = UIColor(named: "signUpBorder")?.cgColor
        
        identification.layer.cornerRadius = 6
        identification.layer.borderWidth = 1.0
        identification.layer.borderColor = UIColor(named: "signUpBorder")?.cgColor
        
        emailTextfield.layer.cornerRadius = 6
        emailTextfield.layer.borderWidth = 1.0
        emailTextfield.layer.borderColor = UIColor(named: "signUpBorder")?.cgColor
        
        usernameTextfield.layer.cornerRadius = 6
        usernameTextfield.layer.borderWidth = 1.0
        usernameTextfield.layer.borderColor = UIColor(named: "signUpBorder")?.cgColor
        
        passwordTextfield.layer.cornerRadius = 6
        passwordTextfield.layer.borderWidth = 1.0
        passwordTextfield.layer.borderColor = UIColor(named: "signUpBorder")?.cgColor
        
        signUpButton.layer.cornerRadius = 6
    }
    
    fileprivate func signUpClicked(){
        guard let name = nameField.text,
              let surname = surnameField.text,
              let fathersName = fathersName.text,
              let idenfi = identification.text,
              let email = emailTextfield.text,
              let username = usernameTextfield.text,
              let pass = passwordTextfield.text else {return}
        if name.count < 3 || surname.count < 4 || fathersName.count < 3 || idenfi.count < 7 || email.count < 7 || username.count < 7 || pass.count < 7{
            showMessage("Məlumatları tam doldurun!")
        }
        
        else{
            print(name,surname,fathersName,idenfi,email,username,pass)
        }
        
    }
    
}

extension RegisterController: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {return}
        switch textField {
        case nameField:
            nameField.layer.borderColor = text.count > 3 ? UIColor(named: "usernameBorder")?.cgColor : UIColor.red.cgColor
            nameField.layer.borderWidth = text.count > 3 ? 1.0 : 2.0
            break
        case surnameField:
            surnameField.layer.borderColor = text.count > 3 ? UIColor(named: "usernameBorder")?.cgColor : UIColor.red.cgColor
            surnameField.layer.borderWidth = text.count > 3 ? 1.0 : 2.0
            break
        case fathersName:
            fathersName.layer.borderColor = text.count > 3 ? UIColor(named: "usernameBorder")?.cgColor : UIColor.red.cgColor
            fathersName.layer.borderWidth = text.count > 3 ? 1.0 : 2.0
            break
        case identification:
            identification.layer.borderColor = text.count > 7 ? UIColor(named: "usernameBorder")?.cgColor : UIColor.red.cgColor
            identification.layer.borderWidth = text.count > 7 ? 1.0 : 2.0
            break
        case emailTextfield:
            emailTextfield.layer.borderColor = text.count > 7 ? UIColor(named: "usernameBorder")?.cgColor : UIColor.red.cgColor
            emailTextfield.layer.borderWidth = text.count > 7 ? 1.0 : 2.0
            break
        case usernameTextfield:
            usernameTextfield.layer.borderColor = text.count > 7 ? UIColor(named: "usernameBorder")?.cgColor : UIColor.red.cgColor
            usernameTextfield.layer.borderWidth = text.count > 7 ? 1.0 : 2.0
            break
        case passwordTextfield:
            passwordTextfield.layer.borderColor = text.count > 7 ? UIColor(named: "usernameBorder")?.cgColor : UIColor.red.cgColor
            passwordTextfield.layer.borderWidth = text.count > 7 ? 1.0 : 2.0
            break
        default: break
        }
    }
}
