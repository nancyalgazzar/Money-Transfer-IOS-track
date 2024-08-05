//
//  TransferViewModel.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 05/08/2024.
//

import Foundation

class TransferViewModel {
    
    var sendCurreuncy: Currency!
    var currencyChangeRate: Double!
    var getsAmount: Double = 0.0
    var sendAmount: Double = 0.0
    
    func calculateSendingAmount(getAmount: Double) {
        self.sendAmount = getAmount * (1 / currencyChangeRate)
    }
    
    func calculateGettingAmount(sendAmount: Double) {
        self.getsAmount = sendAmount * currencyChangeRate
    }
    
    func fetchExchangeRate(from baseCurrency: String, to targetCurrency: String) {
        GetChangeRateAPIManager.getExchangeRate(from: baseCurrency, to: targetCurrency) { error, exchangeRate in
            if let error = error {
                print("Failed to fetch exchange rate: \(error.localizedDescription)")
                return
            }
            
            guard let exchangeRate = exchangeRate else {
                print("No data returned")
                return
            }
            
            self.currencyChangeRate = exchangeRate
        }
    }
}
