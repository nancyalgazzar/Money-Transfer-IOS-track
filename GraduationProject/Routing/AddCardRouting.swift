//
//  AddCardRouting.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit

class AddCardRouting{
    static func goToSelectCurrency(VC: UIViewController){
        let selectCurrency = SelectCurrencyVC()
        VC.navigationController?.pushViewController(selectCurrency, animated: true)
    }
    static func goToAddNewCard(VC: UIViewController){
        let addNewCard = AddNewCardVC()
        VC.navigationController?.pushViewController(addNewCard, animated: true)
    }
    static func goToConnectingProgress(VC:
         UIViewController){
             let connectingProgress = ConnectingProgressVC()
             VC.navigationController?.pushViewController(connectingProgress, animated: true)
    }
    static func goToBankCardOTP(VC:
         UIViewController){
             let bankCardOTP = BankCardOTP()
             VC.navigationController?.pushViewController(bankCardOTP, animated: true)
    }
}
