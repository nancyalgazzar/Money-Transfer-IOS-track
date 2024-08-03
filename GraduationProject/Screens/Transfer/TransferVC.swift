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
    
    var currencyChangeRate = 48.4220
    var getsAmount: Double = 0.0
    var sendAmount: Double = 0.0
    
    //MARK: - lifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendAmountTextFilled.delegate = self
        getsAmountTextFilled.delegate = self
        
        continueBtnView.tintColor = #colorLiteral(red: 0.6062087417, green: 0.1836366951, blue: 0.2688316107, alpha: 1)
        changeRateLabel.text = "1 USD = \(currencyChangeRate) EGP"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sendAmountTextFilled.text = ""
        getsAmountTextFilled.text = ""
    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        print("Continue Pressed")
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension TransferVC : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        let amount = Double(newText) ?? 0.0

        if textField.tag == 1 {
            sendAmount = amount
            getsAmount = sendAmount * currencyChangeRate
            getsAmountTextFilled.text = String(format: "%.2f", getsAmount)
        } else if textField.tag == 2 {
            getsAmount = amount
            sendAmount = getsAmount / currencyChangeRate
            sendAmountTextFilled.text = String(format: "%.2f", sendAmount)
        }
        
        return true
    }
}
