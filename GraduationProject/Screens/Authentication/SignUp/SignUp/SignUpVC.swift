//
//  SignUpVC.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit
protocol SignUpProtocol{
    func getNameValue()->String?
    func getEmailValue()->String?
    func getPasswordValue()->String?
    func displayError(title:String,message:String)
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
    func getNameValue()->String?{
       return nameTextField.text
    }
    func getEmailValue()->String?{
        return emailTextField.text
    }
    func getPasswordValue()->String?{
        return passwordTextField.text
    }
    func displayError(title:String,message:String){
        alertMessage(title: title, message: message)
    }
    func gotToSignUpUserData(){
        AuthenticationRouting.goToSignUpUserDataVC(VC: self)
    }
}
