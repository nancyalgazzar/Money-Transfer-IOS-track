//
//  HomeViewModel.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 04/08/2024.
//

import Foundation

class HomeViewModel {
    var isBalanceHidden = true
    var Balance = "$2,85,856.20"
    var recentTransactionArr: [TransactionCellModel] = []
    
    private func getData() {
        self.recentTransactionArr = DummyTransactionData.recentTransactionArr
    }
    
    func numberOfSections() -> Int {
        return recentTransactionArr.count
    }
}
