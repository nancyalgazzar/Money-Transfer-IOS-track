//
//  TransactionVC + TableView.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 05/08/2024.
//

import UIKit

extension TransactionVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        lastTransactionsTableView.delegate = self
        lastTransactionsTableView.dataSource = self
        self.registerCells()
    }
    
    func registerCells() {
        lastTransactionsTableView.register(UINib(nibName: CellsNames.lastTransactionCell, bundle: nil), forCellReuseIdentifier: CellsNames.lastTransactionCell)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return transactionViewModel.recentTransactionArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = lastTransactionsTableView.dequeueReusableCell(withIdentifier: CellsNames.lastTransactionCell, for: indexPath) as? LastTransactionTableViewCell else {
            return UITableViewCell()
        }
        
        let transaction = transactionViewModel.recentTransactionArr[indexPath.section]
        cell.configureCell(transaction)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TransactionRouting.goToTransactionDetails(VC: self)
    }
}
