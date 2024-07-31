//
//  SignInVC.swift
//  GraduationProject
//
//  Created by 1234 on 30/07/2024.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.hidesBackButton = true
//        let backButton = UIButton()
//        backButton.setTitleColor(UIColor.black, for: .normal)
//        backButton.titleLabel = ""
//        navigationItem.leftBarButtonItem = UIButton()
        // Do any additional setup after loading the view.
    }


    @IBAction func gotToSignUp(_ sender: UIButton) {
        AuthenticationRouting.goToSignUp(VC: self)
    }
    @IBAction func signInBtn(_ sender: UIButton) {
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
