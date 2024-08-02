//
//  TransactionVC.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 31/07/2024.
//

import UIKit

class TransactionVC: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var lastTransactionsTableView: UITableView!
    
    var recentTransactionArr: [TransactionCellModel] = []
    
    //MARK: - lifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getData()
        lastTransactionsTableView.layer.cornerRadius = 8
    }
    
    //MARK: - private functions
    private func setupTableView() {
        lastTransactionsTableView.delegate = self
        lastTransactionsTableView.dataSource = self
        lastTransactionsTableView.register(UINib(nibName: "LastTransactionTableViewCell", bundle: nil), forCellReuseIdentifier: "LastTransactionTableViewCell")
    }
    
    private func getData() {
        self.recentTransactionArr = DummyTransactionData.recentTransactionArr
    }
}

//MARK: - tableView functions
extension TransactionVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return recentTransactionArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = lastTransactionsTableView.dequeueReusableCell(withIdentifier: "LastTransactionTableViewCell", for: indexPath) as? LastTransactionTableViewCell else {
            return UITableViewCell()
        }
        
        let transaction = recentTransactionArr[indexPath.section]
        cell.configureCell(transaction)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}
