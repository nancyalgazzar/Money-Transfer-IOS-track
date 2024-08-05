//
//  TransferViewModel.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 05/08/2024.
//

import Foundation

class TransferViewModel {
    
    var sendCurreuncy
    var currencyChangeRate: Double!
    var getsAmount: Double = 0.0
    var sendAmount: Double = 0.0
    
    func getChangeRate() -> Double {
        return 48.4220
    }
    
    func calculateSendingAmount(getAmount: Double) {
        currencyChangeRate = 1 / getChangeRate()
        self.sendAmount = getAmount * currencyChangeRate
    }
    
    func calculateGettingAmount(sendAmount: Double) {
        currencyChangeRate = getChangeRate()
        self.getsAmount = sendAmount * currencyChangeRate
    }
}
