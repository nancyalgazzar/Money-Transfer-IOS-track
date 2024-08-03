//
//  ServerErrorVC.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 31/07/2024.
//

import UIKit

class ServerErrorVC: UIViewController {

    @IBOutlet weak var messageUsBtnView: UIButton!
    @IBOutlet weak var callUsBtnView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreen()
        
    }
    
    @IBAction func callUsBtnPressed(_ sender: UIButton) {
        print("callUsBtnPressed")
    }
    
    @IBAction func messageUsBtnPressed(_ sender: UIButton) {
        print("messageUsBtnPressed")
    }
}

extension ServerErrorVC {
    private func setUpScreen() {
        messageUsBtnView.layer.borderWidth = 3
        messageUsBtnView.layer.borderColor = #colorLiteral(red: 0.6062087417, green: 0.1836366951, blue: 0.2688316107, alpha: 1)
        messageUsBtnView.layer.cornerRadius = 8
        
        callUsBtnView.layer.cornerRadius = 8
        callUsBtnView.tintColor = #colorLiteral(red: 0.6062087417, green: 0.1836366951, blue: 0.2688316107, alpha: 1)
    }
}
