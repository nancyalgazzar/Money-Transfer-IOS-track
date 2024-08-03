//
//  SignUpVC.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit
protocol SignUpProtocol: DisplayErrorMessageProtocol, ChangePasswordVisibility{
    func getNameValue()->String?
    func getEmailValue()->String?
    func getPasswordValue()->String?
    func gotToSignUpUserData()

}
class SignUpVC: UIViewController {

    @IBOutlet weak var signUpBtn: CustomButton!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var nameTextField: CustomTextField!
    var signUpModelProtocol: SignUpModelProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpModelProtocol = SignUpViewModel(self)
        passwordTextField.handler = signUpModelProtocol.setPasswordVisibilityHander()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToSignIn(_ sender: UIButton){
        AuthenticationRouting.goToSignIn(VC: self)
    }
    @IBAction func signUpBtn(_ sender: UIButton) {
        signUpModelProtocol.validateUserData()
    }
}
extension SignUpVC: SignUpProtocol{
    func showPassword(){
        self.passwordTextField.rightImage = UIImage(named: "Open-eye")
        self.passwordTextField.isSecureTextEntry = false

    }
    func hidePassword() {
        
        self.passwordTextField.rightImage = UIImage(named: "close-eye")
        self.passwordTextField.isSecureTextEntry = true
    }
    func getNameValue()->String?{
       return nameTextField.text
    }
    func getEmailValue()->String?{
        return emailTextField.text
    }
    func getPasswordValue()->String?{
        return passwordTextField.text
    }
    func displayErrorMessage(title:String,message:String){
        alertMessage(title: title, message: message)
    }
    func gotToSignUpUserData(){
        AuthenticationRouting.goToSignUpUserDataVC(VC: self)
    }
}

