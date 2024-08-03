//
//  SignInVC.swift
//  GraduationProject
//
//  Created by 1234 on 30/07/2024.
//

import UIKit


protocol SignInProtocol: DisplayErrorMessageProtocol,ChangePasswordVisibility{
    func getEmailValue()->String?
    func getPasswordValue()->String?
}

class SignInVC: UIViewController {

    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    var signInModelProtocol: SignInModelProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        signInModelProtocol = SignInViewModel(signInProtocol: self)

        passwordTextField.handler = signInModelProtocol.setPasswordVisibilityHander()
//        navigationItem.hidesBackButton = true
//        let backButton = UIButton()
//        backButton.setTitleColor(UIColor.black, for: .normal)
//        backButton.titleLabel = ""
//        navigationItem.leftBarButtonItem = UIButton()
        // Do any additional setup after loading the view.
    }


    @IBAction func gotToSignUp(_ sender: UIButton) {
        AuthenticationRouting.goToSignUp(VC: self)
    }
    @IBAction func signInBtn(_ sender: UIButton) {
        signInModelProtocol.checkSignValidation()
        navigationItem.hidesBackButton = true
        HomeRouting.goToHome(VC: self)
    }
    

}
extension SignInVC: SignInProtocol{
    
   
    func showPassword(){
        self.passwordTextField.rightImage = UIImage(named: "Open-eye")
        self.passwordTextField.isSecureTextEntry = false

    }
    func hidePassword() {
        
        self.passwordTextField.rightImage = UIImage(named: "close-eye")
        self.passwordTextField.isSecureTextEntry = true
    }
    func getEmailValue() -> String? {
        return emailTextField.text
    }
    func getPasswordValue() -> String? {
        return passwordTextField.text
    }
    func displayErrorMessage(title: String, message: String) {
        alertMessage(title: title, message: message)
    }
}

