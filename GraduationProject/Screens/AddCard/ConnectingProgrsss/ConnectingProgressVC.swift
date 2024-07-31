//
//  ConnectingProgressVC.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit

class ConnectingProgressVC: UIViewController {

    @IBOutlet weak var circularProgressOutlet: CircularProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circularProgressOutlet.setProgressWithAnimation(duration: 30.0, value: 1.0)
        // Do any additional setup after loading the view.
    }
}
