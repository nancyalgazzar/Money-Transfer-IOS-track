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
    
    //MARK: - View Model
    let transactionViewModel = TransactionViewModel()
    
    //MARK: - lifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionViewModel.getData()
        setupTableView()
        configView()
    }
    
    private func configView() {
        lastTransactionsTableView.layer.cornerRadius = 8
    }
}
