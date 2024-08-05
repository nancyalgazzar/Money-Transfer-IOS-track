//
//  SignInViewModel.swift
//  GraduationProject
//
//  Created by 1234 on 03/08/2024.
//

import Foundation

protocol SignInModelProtocol: SetPasswordVisibilityHander, DisplayErrorMessageProtocol{
    func checkSignValidation(email: String?, password: String?)
    var goToHome:  (()->())? {get set}

}

class SignInViewModel:SignInModelProtocol{
    let dataValidator: ValidateUserData
    var showError: ((String, String)->Void)?
    var showPassword: (()->Void)?
    var goToHome:  (()->())?
    var hidePassword: (()->Void)?
    var isVisible = false
    init( ){
        dataValidator = ValidateUserData()
    }
    func checkSignValidation(email: String?, password: String?){
        guard isEmailValid(email) && isPasswordValid(password) else {
            showError?("Error","Email or password is invalid")
            return
        }
        SignInAPIManager.signIn(email: email!, password: password!, completion: {error, status in
            if let error = error {
                self.showError?("Error", error.localizedDescription)
            }
            if status {
                //save token
                self.goToHome?()
            }
        })
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

extension SignInViewModel{
    private func isEmailValid(_ email: String?) -> Bool {
        guard let email = email, dataValidator.isFieldEmpty(fieldData: email), dataValidator.isEmailFormatValid(email: email)else {
            return true
        }
        return true
    }
    private func isPasswordValid(_ password: String?)->Bool{
        guard let password = password, dataValidator.isFieldEmpty(fieldData: password), dataValidator.isPasswordLengthValid(password: password), dataValidator.doesPasswordContainsSmallLetter(password: password), dataValidator.isPasswordContainsCapitalLetter(password: password) else{
            return false
        }
        return true
    }
}
