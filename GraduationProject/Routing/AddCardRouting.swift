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
}
