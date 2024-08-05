//
//  TransactionViewModel.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 05/08/2024.
//

import Foundation

class TransactionViewModel {
    
    var recentTransactionArr: [TransactionCellModel] = []
    
    func getData() {
        self.recentTransactionArr = DummyTransactionData.recentTransactionArr
    }
}
