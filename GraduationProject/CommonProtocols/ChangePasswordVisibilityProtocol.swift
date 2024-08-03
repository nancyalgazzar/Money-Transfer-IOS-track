//
//  ChangePasswordVisibilityProtocol.swift
//  GraduationProject
//
//  Created by 1234 on 03/08/2024.
//

import Foundation
protocol ChangePasswordVisibility{
    func showPassword()
    func hidePassword()
}
protocol SetPasswordVisibilityHander{
    func setPasswordVisibilityHander() -> (()->())
}
