//
//  SignInVC.swift
//  GraduationProject
//
//  Created by 1234 on 30/07/2024.
//

import UIKit




class SignInVC: UIViewController {

    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    var signInModelProtocol: SignInModelProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        signInModelProtocol = SignInViewModel()
        bindViewModel()
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
        signInModelProtocol.checkSignValidation(email: emailTextField.text, password: passwordTextField.text)
    }
    

}
extension SignInVC{
    private func bindViewModel(){
        signInModelProtocol.hidePassword = {
            self.passwordTextField.rightImage = UIImage(named: "close-eye")
            self.passwordTextField.isSecureTextEntry = true
        }
        signInModelProtocol.showError = { title, message in
            self.alertMessage(title: title, message: message)
        }
        signInModelProtocol.showPassword = {
            self.passwordTextField.rightImage = UIImage(named: "Open-eye")
            self.passwordTextField.isSecureTextEntry = false
        }
        signInModelProtocol.goToHome = {
            self.navigationItem.hidesBackButton = true
            HomeRouting.goToHome(VC: self)
        }
    }
}

