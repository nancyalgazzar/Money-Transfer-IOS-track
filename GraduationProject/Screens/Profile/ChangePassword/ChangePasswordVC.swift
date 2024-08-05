//
//  ChangePasswordVC.swift
//  GraduationProject
//
//  Created by 1234 on 05/08/2024.
//

import UIKit

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var newPasswordTF: CustomTextField!
    @IBOutlet weak var oldPasswordTF: CustomTextField!
    var changePasswordViewModel: ChangePasswordViewModelProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        changePasswordViewModel = ChangePasswordViewModel()
        bindViewModel()
        navigationItem.hidesBackButton = false
        navigationItem.title = "Change Password"
    }

    @IBAction func saveNewPasswordBtn(_ sender: CustomButton) {
        changePasswordViewModel.changePassword(oldPassword: oldPasswordTF.text, newPassword: newPasswordTF.text, completion: {
            self.newPasswordTF.text = ""
            self.oldPasswordTF.text = ""
            self.alertMessage(title: "Congratulations", message: "your password has changed successfully")
        })
    }
}
extension ChangePasswordVC {
    func bindViewModel(){
        changePasswordViewModel.showError = { title, message in
            self.alertMessage(title: title, message: message)
        }
    }
}
