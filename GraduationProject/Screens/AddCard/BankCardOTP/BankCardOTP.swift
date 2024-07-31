//
//  BankCardOTP.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit

class BankCardOTP: UIViewController {

    @IBOutlet weak var emailMessageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = false
        navigationItem.title = "Bank Card OTP"
        // Do any additional setup after loading the view.
    }

    @IBAction func submitRefillBtn(_ sender: UIButton) {
    }
    @IBAction func resendOTPBtn(_ sender: UIButton) {
    }
}
