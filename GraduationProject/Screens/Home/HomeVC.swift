//
//  HomeVC.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 30/07/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var profilePicView: UIView!
    @IBOutlet weak var curruntBalanceView: UIView!
    @IBOutlet weak var servicesView: UIView!
    @IBOutlet weak var recentTransactionsTableView: UITableView!
    @IBOutlet weak var hideBtnView: UIButton!
    @IBOutlet weak var curruntBalanceTextFilled: UILabel!
    
    //MARK: - view model
    let homeViewModel = HomeViewModel()
    
    //MARK: - lifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - private functions
    private func configView() {
        setupTableView()
        recentTransactionsTableView.layer.cornerRadius = 8
    }
    
    //MARK: - IB Actions
    @IBAction func notificationBtnPressed(_ sender: UIButton) {
        NotificationRouting.goToNotifications(VC: self)
    }
    
    @IBAction func transferBtnPressed(_ sender: UIButton) {
        TransferRouting.goToTransfer(tabBarController: self.tabBarController)
    }
    
    @IBAction func transactionBtnPressed(_ sender: UIButton) {
        TransactionRouting.goToTransactions(tabBarController: self.tabBarController)
    }
    
    @IBAction func cardsBtnPressed(_ sender: UIButton) {
        CardsRouting.goToCards(tabBarController: self.tabBarController)
    }
    
    @IBAction func accountBtnPressed(_ sender: UIButton) {
        AccountRouting.goToAccounts(tabBarController: self.tabBarController)
    }
    
    @IBAction func viewAllBtnPressed(_ sender: UIButton) {
        TransactionRouting.goToTransactions(tabBarController: self.tabBarController)
    }
    @IBAction func hideBtnPressed(_ sender: UIButton) {
        if homeViewModel.isBalanceHidden {
            curruntBalanceTextFilled.text = homeViewModel.Balance
            hideBtnView.setImage(UIImage(named: "close-eye"), for: .normal)
            homeViewModel.isBalanceHidden = false
            
        } else if !homeViewModel.isBalanceHidden {
            curruntBalanceTextFilled.text = "********"
            hideBtnView.setImage(UIImage(named: "Open-eye"), for: .normal)
            homeViewModel.isBalanceHidden = true
            
        }
    }
}
