//
//  SignUpUserDataEntryViewModel.swift
//  GraduationProject
//
//  Created by 1234 on 05/08/2024.
//

import Foundation
protocol SignUpUserDataEntryViewModelProtocol: DisplayErrorMessageProtocol {
    var goToHome: (()->())? {get set}
    func checkDateAndCountryPicking(country: String? , date: String?,nationalID: String?)
}

class SignUpUserDataEntryViewModel:SignUpUserDataEntryViewModelProtocol {
    var showError: ((String, String) -> Void)?
    var goToHome: (()->())?
    func checkDateAndCountryPicking(country: String? , date: String?, nationalID: String?){
        
        guard let _ = country else {
            showError?("Sorry", "Please select your country")
            return
        }
        guard let _ = date else {
            showError?("Sorry", "please enter your birth date")
            return
        }
        guard let nationalID = nationalID, nationalID.count == 14 else {
            showError?("Sorry", "Please enter your nationalID")
            return
        }
        UserModelManager.user.birthday = date
        UserModelManager.user.nationality = country
        UserModelManager.user.nationalID = nationalID
        SignUpAPIManager.signUp(user: UserModelManager.user, completion: {
            error , status, message in
            if let error = error {
                self.showError?("Sorry", error.localizedDescription)
            }
            if let message = message {
                self.showError?("Sorry", message)
            }
            if status {
                //save token
                self.goToHome?()
            }
        })

    }
}
