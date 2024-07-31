//
//  SignUpVC.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var nameTextField: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goToSignIn(_ sender: UIButton){
        AuthenticationRouting.goToSignIn(VC: self)
    }
    @IBAction func signUpBtn(_ sender: UIButton) {
        
        AuthenticationRouting.goToSignUpUserDataVC(VC: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
