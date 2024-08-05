//
//  SignUpVC.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var signUpBtn: CustomButton!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var nameTextField: CustomTextField!
    var signUpViewModelProtocol: SignUpViewModelProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpViewModelProtocol = SignUpViewModel()
        bindViewModel()
        passwordTextField.handler = signUpViewModelProtocol.setPasswordVisibilityHander()
    }

    @IBAction func goToSignIn(_ sender: UIButton){
        AuthenticationRouting.goToSignIn(VC: self)
    }
    @IBAction func signUpBtn(_ sender: UIButton) {
        signUpViewModelProtocol.validateUserData(name: nameTextField.text, email: emailTextField.text, password: passwordTextField.text)
    }
}
extension SignUpVC{
    private func bindViewModel(){
        signUpViewModelProtocol.showError = { title, message in
            self.alertMessage(title: title, message: message)
        }
        signUpViewModelProtocol.hidePassword = {
            self.passwordTextField.rightImage = UIImage(named: "close-eye")
            self.passwordTextField.isSecureTextEntry = true

        }
        signUpViewModelProtocol.showPassword = {
            self.passwordTextField.rightImage = UIImage(named: "Open-eye")
            self.passwordTextField.isSecureTextEntry = false
        }
        signUpViewModelProtocol.goToSignUpGetData = {
            AuthenticationRouting.goToSignUpUserDataVC(VC: self)
        }
    }
    
}

