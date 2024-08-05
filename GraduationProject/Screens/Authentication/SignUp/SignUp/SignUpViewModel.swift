//
//  SignUpViewModel.swift
//  GraduationProject
//
//  Created by 1234 on 02/08/2024.
//

import Foundation
import UIKit
protocol SignUpViewModelProtocol: SetPasswordVisibilityHander, DisplayErrorMessageProtocol{
    func validateUserData(name: String?, email: String?, password: String?)
    var goToSignUpGetData: (()->())? {get set}

}
class SignUpViewModel:SignUpViewModelProtocol{
    var showPassword: (() -> Void)?
    var hidePassword: (() -> Void)?
    var showError: ((String, String) -> Void)?
    var goToSignUpGetData: (()->())?
    var isVisible = false
    let dataValidator = ValidateUserData()
    
    
    func validateUserData(name: String?, email: String?, password: String?){
        
        if isNameFieldValid(name: name) &&
            isEmailFieldValid(email: email) &&
            isPasswordFieldValid(password: password){
            guard let name = name , let email = email, let password = password else {
                return
            }
            let names = name.trimmed.split(separator: " ")
            UserModelManager.createUser(firstName: String(names[0]), lastName: String(names[1]), password: password, email: email)
            goToSignUpGetData?()
        }
    }
    func setPasswordVisibilityHander() -> (()->()) {
      return {
            self.isVisible = !self.isVisible
            if self.isVisible {
                self.showPassword?()
            }else {
                self.hidePassword?()
            }
            
        }
    }
}
//MARK: private functions
extension SignUpViewModel{
    private func isNameFieldValid(name: String?)->Bool{
        guard let name = name,dataValidator.isFieldEmpty(fieldData: name) else{
            showError?("Error","Please enter your Full name")
            return false
        }
        guard dataValidator.validateName(name: name) else{
            showError?("Error","Name field can't contains numbers or special characters")

            return false
        }
        if !didUserEnterFirstAndLastName(name: name){
            return false
        }
        return true
    }
    private func didUserEnterFirstAndLastName(name:String)->Bool{
        guard name.contains(" ") else{
            showError?("Sorry", "please enter your first and last name")
            return false
        }
     
        let names = name.trimmed.split(separator: " ")
        if names.count > 2 {
            showError?("Sorry", "please enter only your first and last name")
                return false
        }else {
                return true
        }
    }
    private func isEmailFieldValid(email: String?) -> Bool {
        guard let email = email, dataValidator.isFieldEmpty(fieldData: email) else {
            showError?("Error","Please enter your email")
            return false
        }
        guard dataValidator.isEmailFormatValid(email: email)else{
            showError?("Error","Please enter valid email format")
            return false
        }
        return true
    }
    private func isPasswordFieldValid(password: String?)->Bool{
        
        guard let password = password, dataValidator.isFieldEmpty(fieldData: password) else {
            showError?("Error","Please enter a password")
            return false
        }
        guard dataValidator.isPasswordContainsCapitalLetter(password: password)else{
            showError?("Error","the password must contains at least one capital letter")

            return false
        }
        guard dataValidator.isPasswordLengthValid(password: password)else{
            showError?("Error","the password length must be at least 8 characters")
            return false
        }
        guard dataValidator.doesPasswordContainsSmallLetter(password: password)else{
            showError?("Error","the password must contains at least one small letter")
            return false
        }
        return true
    }
}
