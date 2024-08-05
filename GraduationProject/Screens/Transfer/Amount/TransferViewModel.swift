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
    static var selectedCurruncy: Int!
    static var reciverName: String!
    static var reciverAccount: String!
    static var currencyChangeRate: Double!
    static var getsAmount: Double = 0.0
    static var sendAmount: Double = 0.0
    
    static func setCurruncy(curruncy: Currency) {
        if selectedCurruncy == 1 {
            TransferViewModel.sendCurreuncy = curruncy
        } else if selectedCurruncy == 2 {
            TransferViewModel.getCurruncy = curruncy
        }
    }
    
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
    
    func makeTransfer(senderAccountId: Int, recipientAccountId: Int, amount: Double, currency: String, status: String, description: String) {
        TransferAPIManager.makeTransfer(senderAccountId: senderAccountId, recipientAccountId: recipientAccountId, amount: amount, currency: currency, status: status, description: description) { error, response in
            if let error = error {
                print("Failed to make transfer: \(error.localizedDescription)")
                return
            }
            
            if let response = response, response.success {
                print("Transfer successful: \(response.message ?? "")")
            } else {
                print("Transfer failed")
            }
        }
    }


}
