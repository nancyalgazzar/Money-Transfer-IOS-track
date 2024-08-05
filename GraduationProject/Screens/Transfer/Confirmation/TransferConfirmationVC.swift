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
    @IBOutlet weak var senderNameTextLabel: UILabel!
    @IBOutlet weak var reciverNameTextLabel: UILabel!
    @IBOutlet weak var confirmBtnView: UIButton!
    @IBOutlet weak var previousBtnView: UIButton!
    @IBOutlet weak var transferImage: UIImageView!
    
    let transferViewModel = TransferViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        self.title = "Transfer"
        transferImage.layer.cornerRadius = transferImage.frame.height/2
        confirmBtnView.tintColor = #colorLiteral(red: 0.6062087417, green: 0.1836366951, blue: 0.2688316107, alpha: 1)
        previousBtnView.layer.borderWidth = 3
        previousBtnView.layer.borderColor = #colorLiteral(red: 0.6062087417, green: 0.1836366951, blue: 0.2688316107, alpha: 1)
        previousBtnView.layer.cornerRadius = 8
        
        reciverNameTextLabel.text = TransferViewModel.reciverName
        amountTextLabel.text = String(TransferViewModel.sendAmount)
        totalAmountTextLabel.text = String(TransferViewModel.getsAmount)
        
    }
    
    @IBAction func confirmBtnPressed(_ sender: UIButton) {
        TransferRouting.goToTransferPayment(VC: self)
    }
    @IBAction func previousBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
