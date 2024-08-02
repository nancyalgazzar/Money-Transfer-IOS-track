//
//  BankCardOTP.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit

class BankCardOTP: UIViewController {

    @IBOutlet weak var sixthNumberTF: CustomTextField!
    @IBOutlet weak var fifthNumberTF: CustomTextField!
    @IBOutlet weak var fourthNumberTF: CustomTextField!
    @IBOutlet weak var thirdNumberTF: CustomTextField!
    @IBOutlet weak var secondNumberTF: CustomTextField!
    @IBOutlet weak var firstNumberTF: CustomTextField!
    @IBOutlet weak var emailMessageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = false
        navigationItem.title = "Bank Card OTP"
        setTextFieldsDelegate()
        addTFTargets()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitRefillBtn(_ sender: UIButton) {
    }
    @IBAction func resendOTPBtn(_ sender: UIButton) {
    }
}
extension BankCardOTP :UITextFieldDelegate{
    
    private func setTextFieldsDelegate() {
        firstNumberTF.delegate = self
        secondNumberTF.delegate = self
        thirdNumberTF.delegate = self
        fourthNumberTF.delegate = self
        fifthNumberTF.delegate = self
        sixthNumberTF.delegate = self

    }
    private func addTFTargets() {
        
        firstNumberTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        secondNumberTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        thirdNumberTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        fourthNumberTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        fifthNumberTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        sixthNumberTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        
        firstNumberTF.becomeFirstResponder()
        
    }
    @objc func textFieldDidChange(textField: UITextField){
        setCurrentTextField(textField: textField)
        reorganizeFirstResponder(textField: textField)

    }
    private func setCurrentTextField(textField: UITextField){
        if textField.text?.count ==  1 {
            colorTextField(textField: textField)
            switch textField {
            case firstNumberTF:
                secondNumberTF.becomeFirstResponder()
            case secondNumberTF:
                thirdNumberTF.becomeFirstResponder()
            case thirdNumberTF:
                fourthNumberTF.becomeFirstResponder()
            case fourthNumberTF:
                fifthNumberTF.becomeFirstResponder()
            case fifthNumberTF:
                sixthNumberTF.becomeFirstResponder()
                self.dismissKeyboard()
            default:
                break
            }
        }
    }
    private func reorganizeFirstResponder(textField: UITextField){
        if textField.text?.count == 0{
            switch textField {
            case firstNumberTF:
                firstNumberTF.becomeFirstResponder()
            case secondNumberTF:
                firstNumberTF.becomeFirstResponder()
            case thirdNumberTF:
                secondNumberTF.becomeFirstResponder()
            case fourthNumberTF:
                thirdNumberTF.becomeFirstResponder()
            case fifthNumberTF:
                fourthNumberTF.becomeFirstResponder()
            default:
                break
            }
        }
        
    }
    func dismissKeyboard(){
        self.view.endEditing(true)
    }
    private func colorTextField(textField: UITextField){
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(hex: "#871E35").cgColor
    }
    
}
