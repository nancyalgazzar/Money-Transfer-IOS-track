//
//  TransferViewModel.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 05/08/2024.
//

import Foundation

class TransferViewModel {
    
    static var sendCurreuncy: Currency!
    static var getCurruncy: Currency!
    static var reciverName: String!
    static var reciverAccount: String!
    static var currencyChangeRate: Double!
    static var getsAmount: Double = 0.0
    static var sendAmount: Double = 0.0
    
    func calculateSendingAmount(getAmount: Double) {
        TransferViewModel.getsAmount = getAmount
        TransferViewModel.sendAmount = getAmount * (1 / TransferViewModel.currencyChangeRate)
    }
    
    func calculateGettingAmount(sendAmount: Double) {
        TransferViewModel.sendAmount = sendAmount
        TransferViewModel.getsAmount = sendAmount * TransferViewModel.currencyChangeRate
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
            
            TransferViewModel.currencyChangeRate = exchangeRate
        }
    }
}
