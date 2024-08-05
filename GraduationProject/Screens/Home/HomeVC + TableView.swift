//
//  HomeVC + TableView.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 04/08/2024.
//

import UIKit

//MARK: - tableView functions

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        self.recentTransactionsTableView.delegate = self
        self.recentTransactionsTableView.dataSource = self
        
        self.registerCells()
    }
    
    func registerCells() {
        recentTransactionsTableView.register(UINib(nibName: CellsNames.recentTransactionCell, bundle: nil), forCellReuseIdentifier: CellsNames.recentTransactionCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = recentTransactionsTableView.dequeueReusableCell(withIdentifier: CellsNames.recentTransactionCell, for: indexPath) as? HomeRecentTransactionTableViewCell else {
            return UITableViewCell()
        }
        
        let transaction = homeViewModel.recentTransactionArr[indexPath.row]
        cell.configureCell(transaction)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}
