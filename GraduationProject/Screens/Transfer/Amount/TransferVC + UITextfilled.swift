//
//  TransferVC + UITextfilled.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 04/08/2024.
//

import UIKit

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
