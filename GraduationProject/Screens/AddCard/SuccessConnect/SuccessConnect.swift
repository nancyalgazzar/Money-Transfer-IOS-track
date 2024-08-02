//
//  SuccessConnect.swift
//  GraduationProject
//
//  Created by 1234 on 02/08/2024.
//

import UIKit

class SuccessConnect: UIViewController {

    @IBOutlet weak var successImage: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        backBtn.layer.borderWidth = 2
        backBtn.layer.borderColor = UIColor(hex: "#871E35").cgColor
        // Do any additional setup after loading the view.
    }


   
    @IBAction func connectAnotherAccountBtn(_ sender: UIButton) {
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
    }
}
