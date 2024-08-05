//
//  ChangePasswordVisibilityProtocol.swift
//  GraduationProject
//
//  Created by 1234 on 03/08/2024.
//

import Foundation

protocol SetPasswordVisibilityHander{
    func setPasswordVisibilityHander() -> (()->())
    var showPassword: (()->Void)? {get set}
    var hidePassword: (()->Void)? {get set}

}
