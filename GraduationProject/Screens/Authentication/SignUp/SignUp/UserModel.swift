//
//  UserModel.swift
//  GraduationProject
//
//  Created by 1234 on 02/08/2024.
//

import Foundation

struct UserModel:Codable{
    let firstName: String!
    let lastName: String!
    let password: String!
    let email: String!
    var birthday: String?
    var nationality: String?
    var nationalID: String?
}
