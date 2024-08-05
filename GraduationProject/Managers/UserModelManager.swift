//
//  UserModelManager.swift
//  GraduationProject
//
//  Created by 1234 on 05/08/2024.
//

import Foundation
struct UserModelManager {
    static var user: UserModel!
    static func createUser(firstName: String, lastName:String, password: String, email: String){
        user = UserModel(firstName: firstName, lastName: lastName, password: password, email: email)
    }
}
