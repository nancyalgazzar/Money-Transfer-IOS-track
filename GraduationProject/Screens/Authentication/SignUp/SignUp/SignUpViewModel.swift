//
//  SignUpViewModel.swift
//  GraduationProject
//
//  Created by 1234 on 02/08/2024.
//

import Foundation
import UIKit
protocol SignUpModelProtocol: SetPasswordVisibilityHander{
    func validateUserData()
    
}
class SignUpViewModel:SignUpModelProtocol{
    var isVisible = false
    let signUpProtocol: SignUpProtocol!
    let dataValidator = ValidateUserData()
    init(_ signUpProtocol: SignUpProtocol){
        self.signUpProtocol = signUpProtocol
    }
    func validateUserData(){
        
        if isNameFieldValid(name: signUpProtocol.getNameValue()) &&
            isEmailFieldValid(email: signUpProtocol.getEmailValue()) &&
            isPasswordFieldValid(password: signUpProtocol.getPasswordValue()){
            signUpProtocol.gotToSignUpUserData()
        }
    }
    func setPasswordVisibilityHander() -> (()->()) {
      return {
            self.isVisible = !self.isVisible
            if self.isVisible {
                self.signUpProtocol.showPassword()
            }else {
                self.signUpProtocol.hidePassword()
            }
            
        }
    }
}
//MARK: private functions
extension SignUpViewModel{
    private func isNameFieldValid(name: String?)->Bool{
        guard let name = signUpProtocol.getNameValue(),dataValidator.isFieldEmpty(fieldData: name) else{
            signUpProtocol.displayErrorMessage(title: "Error", message: "Please enter your Full name")
            return false
        }
        guard dataValidator.validateName(name: name) else{
            signUpProtocol.displayErrorMessage(title: "Error", message: "Name field can't contains numbers or special characters")
            return false
        }
        return true
    }
    private func isEmailFieldValid(email: String?) -> Bool {
        guard let email = signUpProtocol.getEmailValue(), dataValidator.isFieldEmpty(fieldData: email) else {
            signUpProtocol.displayErrorMessage(title: "Error", message: "Please enter your email")
            return false
        }
        guard dataValidator.isEmailFormatValid(email: email)else{
            signUpProtocol.displayErrorMessage(title: "Error", message: "Please enter valid email format")
            return false
        }
        return true
    }
    private func isPasswordFieldValid(password: String?)->Bool{
        
        guard let password = signUpProtocol.getPasswordValue(), dataValidator.isFieldEmpty(fieldData: password) else {
            signUpProtocol.displayErrorMessage(title: "Error", message: "Please enter a password")
            return false
        }
        guard dataValidator.isPasswordContainsCapitalLetter(password: password)else{
            signUpProtocol.displayErrorMessage(title: "Error", message: "the password must contains at least one capital letter")
            return false
        }
        guard dataValidator.isPasswordLengthValid(password: password)else{
            signUpProtocol.displayErrorMessage(title: "Error", message: "the password length must be at least 8 characters")
            return false
        }
        guard dataValidator.doesPasswordContainsSmallLetter(password: password)else{
            signUpProtocol.displayErrorMessage(title: "Error", message: "the password must contains at least one small letter")
            return false
        }
        return true
    }
}
