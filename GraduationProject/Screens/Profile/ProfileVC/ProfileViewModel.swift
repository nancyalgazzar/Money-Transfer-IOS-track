//
//  ProfileViewModel.swift
//  GraduationProject
//
//  Created by 1234 on 06/08/2024.
//

import Foundation
protocol ProfileViewModelProtocol: DisplayErrorMessageProtocol{
    func logOut()
    var goToSignIn: (()->())? {get set}
}
class ProfileViewModel:ProfileViewModelProtocol {
    var showError: ((String, String) -> Void)?
    var goToSignIn: (()->())?
    func logOut(){
        LogOutAPIManager.logOut(completion: {
            error, status in
            if let error = error {
                self.showError?("Sorry", error.localizedDescription)
            }
            if status {
//                remove token
                self.goToSignIn?()
            }
        })
    }
}
