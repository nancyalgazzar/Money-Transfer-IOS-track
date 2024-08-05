//
//  ChangePasswordViewModel.swift
//  GraduationProject
//
//  Created by 1234 on 05/08/2024.
//

import Foundation
protocol ChangePasswordViewModelProtocol: DisplayErrorMessageProtocol {
    func changePassword(oldPassword: String?, newPassword: String?,completion: @escaping ()->())
}
class ChangePasswordViewModel: ChangePasswordViewModelProtocol{
    var showError: ((String, String) -> Void)?
    let dataValidator = ValidateUserData()
    func changePassword(oldPassword: String?, newPassword: String?,completion: @escaping ()->()){
        
        if isNewPasswordValid(password: newPassword) && isOldPasswordValid(password: oldPassword){
            
              ChangePasswordAPIManager.changePassword(oldPassword: oldPassword!, newPassword: newPassword!, completion: {
                   error, status in
                   if let error = error {
                       self.showError?("Sorry", error.localizedDescription)
                   }
                   if status {
                      completion()
                   }
              })
        }
    }
}
//MARK: private functions
extension ChangePasswordViewModel {
    private func isOldPasswordValid(password: String?)->Bool{
           guard dataValidator.isFieldEmpty(fieldData: password) else {
               showError?("Error", "Please Enter your old password")
               return false
           }
           guard let password = password, dataValidator.isPasswordLengthValid(password: password), dataValidator.doesPasswordContainsSmallLetter(password: password), dataValidator.isPasswordContainsCapitalLetter(password: password) else{
               showError?("Error", "your old password is wrong")
               return false
           }
           return true
       }
       private func isNewPasswordValid(password: String?)->Bool{
           guard let password = password, dataValidator.isFieldEmpty(fieldData: password) else {
               showError?("Error","Please enter your new password")
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
