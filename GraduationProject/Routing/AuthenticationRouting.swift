//
//  AuthenticationRouting.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit

struct AuthenticationRouting{
    
    static  func goToSignUpUserDataVC(VC: UIViewController) {
        let userDataVC = SignUpUserDataEntryVC()
        VC.navigationController?.pushViewController(userDataVC, animated: true)
    }
    static func goToSignIn(VC: UIViewController) {
        let signInVC = SignInVC()
        VC.navigationController?.pushViewController(signInVC, animated: true)
    }
    static func goToSignUp(VC: UIViewController) {
        let signUpVC = SignUpVC()
        VC.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
}


