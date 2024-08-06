//
//  DummyTransactionData.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 03/08/2024.
//

import UIKit

class DummyTransactionData {
    static let recentTransactionArr: [TransactionCellModel] = [
        TransactionCellModel(name: "Ahmed", cardTypeName: "MasterCard", lastFourNumbers: "0015", date: "Today 11:00", transactionType: "Recived", amount: "$ 1000", isSuccessful: true),
        
        TransactionCellModel(name: "Hany", cardTypeName: "MasterCard", lastFourNumbers: "8452", date: "Today 12:00", transactionType: "Recived", amount: "$ 5000", isSuccessful: true),
        
        TransactionCellModel(name: "Omar", cardTypeName: "MasterCard", lastFourNumbers: "1234", date: "04/06/24 1:00", transactionType: "Recived", amount: "$ 1000", isSuccessful: false),
    ]
}
