//
//  TransferVC.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 31/07/2024.
//

import UIKit
import SDWebImage

class TransferVC: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var changeRateFrameView: UIView!
    @IBOutlet weak var changeRateLabel: UILabel!
    @IBOutlet weak var sendAmountTextFilled: UITextField!
    @IBOutlet weak var getsAmountTextFilled: UITextField!
    @IBOutlet weak var recepentNameTextFilled: UITextField!
    @IBOutlet weak var recepentAccountTextFilled: UITextField!
    @IBOutlet weak var continueBtnView: UIButton!
    @IBOutlet weak var sendCurrencyFlag: UIImageView!
    @IBOutlet weak var sendCurruncyName: UILabel!
    @IBOutlet weak var getCurrencyFlag: UIImageView!
    @IBOutlet weak var getCurrencyName: UILabel!
    
    
    //MARK: - View Model
    let transferViewModel = TransferViewModel()
    
    //MARK: - lifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDismissKeyBoard()
        setupTextfilleds()
        transferViewModel.fetchExchangeRate(from: "USD", to: "EGP")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configView()
        transferViewModel.makeTransfer(senderAccountId: 1, recipientAccountId: 3, amount: 100.0, currency: "USD", status: "PENDING", description: "Payment for services")
    }
    
    private func configView() {
        setupTextfilleds()
        setupNavigationBar()
        continueBtnView.tintColor = #colorLiteral(red: 0.6062087417, green: 0.1836366951, blue: 0.2688316107, alpha: 1)
        changeRateLabel.text = "1 USD = \(TransferViewModel.currencyChangeRate ?? 48.422) EGP"
        sendAmountTextFilled.text = ""
        getsAmountTextFilled.text = ""
    }
    
    private func setupNavigationBar() {
        self.title = "Transfer"
        navigationItem.backButtonTitle = ""
        navigationItem.hidesBackButton = false
    }
    
    @IBAction func sendCurrencyPressed(_ sender: UIButton) {
        TransferViewModel.selectedCurruncy = 1
        TransferRouting.goToTransferSelectCurruncy(VC: self)
    }
    
    @IBAction func reciveCurruncyPressed(_ sender: UIButton) {
        TransferViewModel.selectedCurruncy = 2
        TransferRouting.goToTransferSelectCurruncy(VC: self)
    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        if transferValidation() {
            self.setData()
            TransferRouting.goToTransferConfirmation(VC: self)
        }
    }
}

extension TransferVC {
    func transferValidation() -> Bool {
        guard sendAmountTextFilled.text != "" || sendAmountTextFilled.text != "0.0" else {
            alertMessage(title: "Sorry", message: "Enter how much do you wnt to send")
            return false
        }
        
        guard getsAmountTextFilled.text != "" || getsAmountTextFilled.text != "0.0" else {
            alertMessage(title: "Sorry", message: "Enter how much do you wnt to send")
            return false
        }
        
        guard Double(sendAmountTextFilled.text!) != nil else {
            alertMessage(title: "Sorry", message: "invaid input")
            return false
        }
        
        guard Double(sendAmountTextFilled.text!) != nil else {
            alertMessage(title: "Sorry", message: "invaid input")
            return false
        }
        
        guard recepentNameTextFilled.text?.trimmed != "" else {
            alertMessage(title: "Sorry", message: "Please Enter Recipents Name")
            return false
        }
        
        guard recepentAccountTextFilled.text?.trimmed != "" else {
            alertMessage(title: "Sorry", message: "Please Enter Recipents Account Number")
            return false
        }
        
        return true
    }
    
    func setData() {
        TransferViewModel.reciverName = recepentNameTextFilled.text
        TransferViewModel.reciverAccount = recepentAccountTextFilled.text
    }
}
