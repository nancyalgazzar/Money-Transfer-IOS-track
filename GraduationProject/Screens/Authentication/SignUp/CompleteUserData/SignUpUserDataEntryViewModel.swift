//
//  SignUpUserDataEntryViewModel.swift
//  GraduationProject
//
//  Created by 1234 on 05/08/2024.
//

import Foundation
protocol SignUpUserDataEntryViewModelProtocol: DisplayErrorMessageProtocol {
    var goToHome: (()->())? {get set}
    func checkDateAndCountryPicking(country: String? , date: String?)
}

class SignUpUserDataEntryViewModel:SignUpUserDataEntryViewModelProtocol {
    var showError: ((String, String) -> Void)?
    var goToHome: (()->())?
    func checkDateAndCountryPicking(country: String? , date: String?){
        
        guard let country = country else {
            showError?("Sorry", "Please select your country")
            return
        }
        guard let date = date else {
            showError?("Sorry", "please enter your birth date")
            return
        }
        goToHome?()

    }
}
