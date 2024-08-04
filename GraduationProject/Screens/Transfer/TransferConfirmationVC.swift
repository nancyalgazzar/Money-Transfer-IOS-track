//
//  TransferConfirmationVC.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 04/08/2024.
//

import UIKit

class TransferConfirmationVC: UIViewController {
    
    @IBOutlet weak var amountTextLabel: UILabel!
    @IBOutlet weak var totalAmountTextLabel: UILabel!
    @IBOutlet weak var confirmBtnView: UIButton!
    @IBOutlet weak var previousBtnView: UIButton!
    @IBOutlet weak var transferImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    private func setupScreen() {
        self.title = "Transfer"
        transferImage.layer.cornerRadius = transferImage.frame.height/2
        confirmBtnView.tintColor = #colorLiteral(red: 0.6062087417, green: 0.1836366951, blue: 0.2688316107, alpha: 1)
        previousBtnView.layer.borderWidth = 3
        previousBtnView.layer.borderColor = #colorLiteral(red: 0.6062087417, green: 0.1836366951, blue: 0.2688316107, alpha: 1)
        previousBtnView.layer.cornerRadius = 8
    }
    
    @IBAction func confirmBtnPressed(_ sender: UIButton) {
        print("Confirm Pressed")
    }
    @IBAction func previousBtnPressed(_ sender: UIButton) {
        print("Previous Pressed")
    }
}
