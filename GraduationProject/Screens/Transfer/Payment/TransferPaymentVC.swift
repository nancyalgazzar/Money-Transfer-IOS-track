//
//  TransferPaymentVC.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 05/08/2024.
//

import UIKit

class TransferPaymentVC: UIViewController {
    @IBOutlet weak var confirmBtnView: UIButton!
    @IBOutlet weak var favouriteBtnView: UIButton!
    @IBOutlet weak var reciverNameTextLabel: UILabel!
    @IBOutlet weak var totalAmountTextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        self.title = "Transfer"
        confirmBtnView.tintColor = #colorLiteral(red: 0.6062087417, green: 0.1836366951, blue: 0.2688316107, alpha: 1)
        favouriteBtnView.layer.borderWidth = 3
        favouriteBtnView.layer.borderColor = #colorLiteral(red: 0.6062087417, green: 0.1836366951, blue: 0.2688316107, alpha: 1)
        favouriteBtnView.layer.cornerRadius = 8
        
        reciverNameTextLabel.text = TransferViewModel.reciverName
        totalAmountTextLabel.text = String(TransferViewModel.getsAmount)
    }
    @IBAction func confirmBtnPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
