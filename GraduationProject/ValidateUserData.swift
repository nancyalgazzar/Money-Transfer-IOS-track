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
   
    func validateImage (enterdImage: UIImage?, message: inout String?)-> Bool{
        guard enterdImage?.pngData() != UIImage(named: "profile-Placeholder")?.pngData() else {
             message = "please pick profile image"
            return false
        }
        return true
    }
    
    func validateName(enteredname: String?, message:  inout String? )-> Bool{
        guard enteredname?.trimmed  != "" else {
             message = "please enter your name"
            return false
        }
        return true
    }
    
    func validateEmail(enteredEmail:String?, message: inout String?) -> Bool {
        guard enteredEmail?.trimmed != "" else {
            message = "please enter your email"
            return false
        }
        return isEmailFormatValid(email: enteredEmail!,message: &message)
    }
  
    func validatePassword(enteredPassword: String?,message: inout String?)-> Bool{
        guard enteredPassword?.trimmed  != "" else {
           message = "please enter your password"
            return false
        }
        if let password = enteredPassword{
            if isPasswordLengthValid(password: password, message: &message) {
            if isPasswordContainsCapitalLetter(password: password, message: &message){
                if doesPasswordContainsSmallLetter(password: password, message: &message){
                    if doesPasswordContainsDigit(password: password, message: &message){
                        return true
                    }
                }
             }
          }
        }
        return false
    }
    func validatePhoneNumber(enteredPhoneNumber: String?, message: inout String?)-> Bool{
        guard enteredPhoneNumber?.trimmed  != "" else {
            message = "please enter your phone number"
            return false
        }
        if isPhoneNumber11Digit(phoneNumber: enteredPhoneNumber!, message: &message) {
            if isPhoneNumberEgyptian(phoneNumber: enteredPhoneNumber!, message: &message){
                return true
            }
        }
        return false
    }
    
}
//MARK: private functions
extension ValidateUserData {
    private func isPhoneNumber11Digit( phoneNumber: String,message: inout String?)-> Bool{
        guard phoneNumber.count == phoneLengthOfEgypt else {
            message = "the phone number must be 11 digit"
            return false
        }
        return true
    }
    private func isPhoneNumberEgyptian(phoneNumber: String,message: inout String?)-> Bool{
           let pattern = "^(011|015|012|010)"
           let regex = try? NSRegularExpression(pattern: pattern)
           let range = NSRange(location: 0, length: phoneNumber.utf16.count)
           if let match = regex?.firstMatch(in: phoneNumber, options: [], range: range) {
               return match.range.location != NSNotFound
           }
            message = "the phone number must be egyptian"
           return false
        
    }
    private func isEmailFormatValid(email: String, message: inout String?)-> Bool{
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        guard emailPredicate.evaluate(with: email)else {
            
            message = "please enter a valid email"
            return false
        }
        return true
    }
    private func isPasswordLengthValid(password: String,message: inout String?)-> Bool{
        guard password.count >= minPasswordLength else {
            message = "the password length must be 8 letters at least"
            return false
        }
        return true
    }
    private func isPasswordContainsCapitalLetter(password: String ,message: inout String?)-> Bool{
        let capitalLetterPattern = ".*[A-Z]*."
        let passwordPredected = NSPredicate(format:"SELF MATCHES %@", capitalLetterPattern)
        
        guard passwordPredected.evaluate(with: password) else {
          message = "the password length must contains capital letter"
            return false
        }
        return true
        
    }
    private func doesPasswordContainsSmallLetter(password: String,message: inout String?)-> Bool{
        let smallLetterPattern = ".*[a-z]*."
        let passwordPredected = NSPredicate(format:"SELF MATCHES %@", smallLetterPattern)
        
        guard passwordPredected.evaluate(with: password)else {
            message = "the password length must contains small letter"
            return false
        }
        return true
        
    }
    private func doesPasswordContainsDigit(password: String,message: inout String?)-> Bool{
        let digitPattern = ".*\\d.*"
        let passwordPredected = NSPredicate(format:"SELF MATCHES %@", digitPattern)
        
        guard passwordPredected.evaluate(with: password) else {
            message = "the password length must contains one digit at least"
            return false
        }
        return true

    }
}
