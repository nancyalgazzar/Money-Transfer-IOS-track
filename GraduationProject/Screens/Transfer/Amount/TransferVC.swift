//
//  TransferVC.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 31/07/2024.
//

import UIKit

class TransferVC: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var stepOneView: StepView!
    @IBOutlet weak var stepTwoView: UIView!
    @IBOutlet weak var stepThreeView: UIView!
    @IBOutlet weak var changeRateFrameView: UIView!
    @IBOutlet weak var changeRateLabel: UILabel!
    @IBOutlet weak var sendAmountTextFilled: UITextField!
    @IBOutlet weak var getsAmountTextFilled: UITextField!
    @IBOutlet weak var recepentNameTextFilled: UITextField!
    @IBOutlet weak var recepentAccountTextFilled: UITextField!
    @IBOutlet weak var continueBtnView: UIButton!
    
    //MARK: - View Model
    let transferViewModel = TransferViewModel()
    
    //MARK: - lifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDismissKeyBoard()
        setupTextfilleds()
        fetchCurrencies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configView()
    }
    
    private func configView() {
        setupTextfilleds()
        setupNavigationBar()
        continueBtnView.tintColor = #colorLiteral(red: 0.6062087417, green: 0.1836366951, blue: 0.2688316107, alpha: 1)
        changeRateLabel.text = "1 USD = \(transferViewModel.getChangeRate()) EGP"
        sendAmountTextFilled.text = ""
        getsAmountTextFilled.text = ""
    }
    
    private func setupNavigationBar() {
        self.title = "Transfer"
        navigationItem.backButtonTitle = ""
        navigationItem.hidesBackButton = false
    }
    
    @IBAction func sendCurrencyPressed(_ sender: UIButton) {
        TransferRouting.goToTransferSelectCurruncy(VC: self)
    }
    
    @IBAction func reciveCurruncyPressed(_ sender: UIButton) {
        TransferRouting.goToTransferSelectCurruncy(VC: self)
    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        if transferValidation() {
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
}


extension TransferVC {
    func fetchCurrencies() {
            GetChangeRateAPIManager.getCurrencies { error, changeRate in
                if let error = error {
                    print("Failed to fetch currencies: \(error.localizedDescription)")
                    return
                }
                
                guard let changeRate = changeRate else {
                    print("No data returned")
                    return
                }
                
                // Process the data
                self.processChangeRate(changeRate: changeRate)
            }
        }
        
        func processChangeRate(changeRate: ChangeRate) {
            print("Base Code: \(changeRate.baseCode)")
            for (currency, rate) in changeRate.conversionRates {
                print("\(currency): \(rate)")
            }
        }
}
