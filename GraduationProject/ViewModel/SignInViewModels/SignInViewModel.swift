//
//  SignInViewModel.swift
//  GraduationProject
//
//  Created by 1234 on 03/08/2024.
//

import Foundation

protocol SignInModelProtocol: SetPasswordVisibilityHander{
    func checkSignValidation()
}

class SignInViewModel:SignInModelProtocol{
    let signInProtocol: SignInProtocol
    let dataValidator: ValidateUserData
    var isVisible = false
    init(signInProtocol: SignInProtocol ){
        self.signInProtocol = signInProtocol
        dataValidator = ValidateUserData()
    }
    func checkSignValidation(){
        guard isEmailValid() && isPasswordValid() else {
            signInProtocol.displayErrorMessage(title: "Error", message: "Email or password are invalid")
            return
        }
    }
    func setPasswordVisibilityHander() -> (()->()) {
      return {
            self.isVisible = !self.isVisible
            if self.isVisible {
                self.signInProtocol.showPassword()
            }else {
                self.signInProtocol.hidePassword()
            }
            
        }
    }
}

extension SignInViewModel{
    private func isEmailValid() -> Bool {
        guard let email = signInProtocol.getEmailValue(), dataValidator.isFieldEmpty(fieldData: email), dataValidator.isEmailFormatValid(email: email)else {
            
            return true
        }
        
        return true
    }
    private func isPasswordValid()->Bool{
        guard let password = signInProtocol.getPasswordValue(), dataValidator.isFieldEmpty(fieldData: password), dataValidator.isPasswordLengthValid(password: password), dataValidator.doesPasswordContainsSmallLetter(password: password), dataValidator.isPasswordContainsCapitalLetter(password: password) else{
            return false
        }
        return true
    }
}
