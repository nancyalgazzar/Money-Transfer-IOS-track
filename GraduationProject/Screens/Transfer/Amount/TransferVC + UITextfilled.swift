//
//  TransferVC + UITextfilled.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 04/08/2024.
//

import UIKit

extension TransferVC : UITextFieldDelegate{
    
    func setupTextfilleds() {
        sendAmountTextFilled.delegate = self
        getsAmountTextFilled.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        let amount = Double(newText) ?? 0.0

        if textField.tag == 1 {
            transferViewModel.calculateGettingAmount(sendAmount: amount)
            getsAmountTextFilled.text = String(format: "%.2f", transferViewModel.getsAmount)
        } else if textField.tag == 2 {
            transferViewModel.calculateSendingAmount(getAmount: amount)
            sendAmountTextFilled.text = String(format: "%.2f", transferViewModel.sendAmount)
        }
        
        return true
    }
}
