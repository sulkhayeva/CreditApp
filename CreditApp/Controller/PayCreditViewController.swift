//
//  PayCreditViewController.swift
//  CreditApp
//
//  Created by Gumru on 6/12/24.
//

import UIKit

class PayCreditViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var finalAmount: UILabel!
    
    @IBOutlet weak var cardNumber: UITextField!
    @IBOutlet weak var cardMonth: UITextField!
    @IBOutlet weak var cardYear: UITextField!
    @IBOutlet weak var cardCvv: UITextField!
    @IBOutlet weak var amountAzn: UITextField!
    @IBOutlet weak var payButton: UIButton!
    
    let allowedYears = Array(2024...2034)
    
    
    @IBAction func payButton(_ sender: UIButton){
        payButtonClicked()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        payButton.layer.cornerRadius = 6
        
        cardNumber.delegate = self
        cardMonth.delegate = self
        cardYear.delegate = self
        cardCvv.delegate = self

        cardNumber.keyboardType = .numberPad
        cardMonth.keyboardType = .numberPad
        cardYear.keyboardType = .numberPad
        cardCvv.keyboardType = .numberPad
        amountAzn.keyboardType = .numberPad
    }
    
    func payButtonClicked(){
        guard let cardNum = cardNumber.text,
              let month = cardMonth.text,
              let year = cardYear.text,
              let cvv = cardCvv.text,
              let azn = amountAzn.text else {return}
        
        if cardNum.count >= 0 && cardNum.count < 16 || month.count == 0 || year.count == 0 || cvv.count == 0 || azn.count == 0 {
            showMessage("Məlumatları tam daxil edin!")
        }
              
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
            guard let text = textField.text else { return }
            
            switch textField {
            case cardNumber:
                let isValid = text.count == 16 && text.isNumeric
                textField.layer.borderColor = isValid ? UIColor.clear.cgColor : UIColor.red.cgColor
                textField.layer.borderWidth = isValid ? 0.0 : 1.0
                
            case cardMonth:
                if let number = Int(text), number >= 1 && number <= 12 {
                    textField.layer.borderColor = UIColor.clear.cgColor
                    textField.layer.borderWidth = 0.0
                } else {
                    textField.layer.borderColor = UIColor.red.cgColor
                    textField.layer.borderWidth = 1.0
                }
                
            case cardYear:
                if let number = Int(text), allowedYears.contains(number) {
                    textField.layer.borderColor = UIColor.clear.cgColor
                    textField.layer.borderWidth = 0.0
                } else {
                    textField.layer.borderColor = UIColor.red.cgColor
                    textField.layer.borderWidth = 1.0
                }
                
            case cardCvv:
                let isValid = text.count == 3 && text.isNumeric
                textField.layer.borderColor = isValid ? UIColor.clear.cgColor : UIColor.red.cgColor
                textField.layer.borderWidth = isValid ? 0.0 : 1.0
                
            default:
                break
            }
        }
    
    // UITextFieldDelegate metodu
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Eski metni al
        guard let oldText = textField.text else { return true }
        
        // Yeni metni hesapla
        let updatedText = (oldText as NSString).replacingCharacters(in: range, with: string)
        
        // Boş metin ise (tüm metin silindiğinde), true döndürerek silmeyi kabul et
        if updatedText.isEmpty {
            return true
        }
        
        // İlk karakteri silme durumu
        if string.isEmpty && range.location == 0 {
            return true
        }
        
        // cardNumber kısıtlamaları
        if textField == cardNumber {
            let isValid = updatedText.count <= 16 && updatedText.isNumeric
            return isValid
        }
        
        // cardMonth kısıtlamaları
        if textField == cardMonth {
            if let number = Int(updatedText), number >= 1 && number <= 12 {
                return updatedText.count <= 2
            } else {
                return false
            }
        }
        
        // cardYear kısıtlamaları
        if textField == cardYear {
            if updatedText.count <= 4 {
                if let number = Int(updatedText), number >= 2024 && number <= 2034 {
                    return true
                } else if updatedText.count < 4 {
                    return true
                } else {
                    return false
                }
            }
            return false
        }

        
        // cardCvv kısıtlamaları
        if textField == cardCvv {
            return updatedText.count <= 3 && updatedText.isNumeric
        }
        
        return true
    }

    }

    // String uzantısı ile sayısal kontrolü sağlama
    extension String {
        var isNumeric: Bool {
            return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
        }
    }
