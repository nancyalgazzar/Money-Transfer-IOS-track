//
//  EditProfileViewModel.swift
//  GraduationProject
//
//  Created by 1234 on 05/08/2024.
//

import Foundation
protocol EditProfileViewModelProtocol:DisplayErrorMessageProtocol {
    
}
class EditProfileViewModel: EditProfileViewModelProtocol{
    var showError: ((String, String) -> Void)?
    
    let dataValidator = ValidateUserData()
    
    func EditProfile(fullName: String?, email: String?, country: String?, birthdate: String?){
        if let data = createModel(fullName: fullName, email: email, country: country, birthdate: birthdate){
            
            EditProfileAPIManager.editProfile(profileData: data, completion: {
                error, status in
                if let error = error {
                    self.showError? ("Sorry", error.localizedDescription)
                }
                if status {
                    ////
                }
            })
        }
        
    }
    
    
}
extension EditProfileViewModel {
    private func createModel(fullName: String?, email: String?, country: String?, birthdate: String?)->EditProfileModel? {
        guard isNameFieldValid(name: fullName), isEmailFieldValid(email: email), let country = country, let birthdate = birthdate, let name = fullName, let email = email else{
            return nil
        }
        let nameArr = name.trimmed.split(separator: " ")
        let profileData = EditProfileModel(firstName: String(nameArr[0]), lastName: String(nameArr[1]), email: email, country: country, birthdate: birthdate)
        return profileData
    }
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
        
        if name.contains(" "){
            let names = name.trimmed.split(separator: " ")
            if names.count < 2 {
                showError?("Sorry", "please enter your first and last name")
                return false
            } else if names.count>2{
                showError?("Sorry", "please enter only your first and last name")
                return false
            }
        }
        return true
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
}
