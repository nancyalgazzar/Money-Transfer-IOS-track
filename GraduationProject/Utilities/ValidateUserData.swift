//
//  ValidateUserData.swift
//  lec12
//
//  Created by 1234 on 18/07/2024.
//

import Foundation
import  UIKit


let phoneLengthOfEgypt = 11
let minPasswordLength = 8

struct ValidateUserData {
    //MARK: check empty field
    func isFieldEmpty(fieldData: String? )-> Bool{
        guard fieldData?.trimmed  != "" else {
            return false
        }
        return true
    }
    //MARK: name validation
    func validateName(name: String)->Bool{
        let nameRegex = "^[a-zA-Z\\s'-]+$"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return namePredicate.evaluate(with: name)
    }
    
    //MARK: email Validation
    func isEmailFormatValid(email: String)-> Bool{
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        guard emailPredicate.evaluate(with: email)else {
            return false
        }
        return true
    }
    
}
//MARK: phone number validation
extension ValidateUserData{
    
    
    func isPhoneNumber11Digit( phoneNumber: String)-> Bool{
        guard phoneNumber.count == phoneLengthOfEgypt else {
            return false
        }
        return true
    }
    func isPhoneNumberEgyptian(phoneNumber: String)-> Bool{
           let pattern = "^(011|015|012|010)"
           let regex = try? NSRegularExpression(pattern: pattern)
           let range = NSRange(location: 0, length: phoneNumber.utf16.count)
           if let match = regex?.firstMatch(in: phoneNumber, options: [], range: range) {
               return match.range.location != NSNotFound
           }
           return false
        
    }
}
//MARK: password validations
extension ValidateUserData {
    func isPasswordLengthValid(password: String)-> Bool{
        guard password.count >= minPasswordLength else {
            return false
        }
        return true
    }
    func isPasswordContainsCapitalLetter(password: String)-> Bool{
        let capitalLetterPattern = ".*[A-Z]*."
        let passwordPredict = NSPredicate(format:"SELF MATCHES %@", capitalLetterPattern)
        
        guard passwordPredict.evaluate(with: password) else {
            return false
        }
        return true
        
    }
    func doesPasswordContainsSmallLetter(password: String)-> Bool{
       let smallLetterPattern = ".*[a-z]*."
       let passwordPredicted = NSPredicate(format:"SELF MATCHES %@", smallLetterPattern)
       
       guard passwordPredicted.evaluate(with: password)else {
           return false
       }
       return true
       
   }
    
    private func doesPasswordContainsDigit(password: String)-> Bool{
        let digitPattern = ".*\\d.*"
        let passwordPredicted = NSPredicate(format:"SELF MATCHES %@", digitPattern)
        guard passwordPredicted.evaluate(with: password) else {
            return false
        }
        return true

    }
}
