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
    @IBOutlet private weak var idenfication: UITextField!
    @IBOutlet private weak var usernameTextfield: UITextField!
    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var backButton: UIButton!
    
    @IBAction func signUpActionRegister(_ sender: UIButton){
        
    }
    
    @IBAction func backAction(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        navigationController?
            .setNavigationBarHidden(true, animated: true) //default backi gorunmez edir

        // Do any additional setup after loading the view.
    }
    
    fileprivate func configureDesign(){
        let redColor: CGFloat = 32.0 / 255.0
        let greenColor: CGFloat = 49.0 / 255.0
        let blueColor: CGFloat = 96.0 / 255.0
        let borderColorButton = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
        
        nameField.layer.cornerRadius = 6
        nameField.layer.borderWidth = 1.0
        nameField.layer.borderColor = borderColorButton.cgColor
        
        surnameField.layer.cornerRadius = 6
        surnameField.layer.borderWidth = 1.0
        surnameField.layer.borderColor = borderColorButton.cgColor
        
        fathersName.layer.cornerRadius = 6
        fathersName.layer.borderWidth = 1.0
        fathersName.layer.borderColor = borderColorButton.cgColor
        
        idenfication.layer.cornerRadius = 6
        idenfication.layer.borderWidth = 1.0
        idenfication.layer.borderColor = borderColorButton.cgColor
        
        usernameTextfield.layer.cornerRadius = 6
        usernameTextfield.layer.borderWidth = 1.0
        usernameTextfield.layer.borderColor = borderColorButton.cgColor
        
        passwordTextfield.layer.cornerRadius = 6
        passwordTextfield.layer.borderWidth = 1.0
        passwordTextfield.layer.borderColor = borderColorButton.cgColor
        
        signUpButton.layer.cornerRadius = 6
    }

}
