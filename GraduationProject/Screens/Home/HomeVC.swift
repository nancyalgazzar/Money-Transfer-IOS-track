//
//  HomeVC.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 30/07/2024.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var profilePicView: UIView!
    @IBOutlet weak var curruntBalanceView: UIView!
    @IBOutlet weak var servicesView: UIView!
    @IBOutlet weak var recentTransactionsTableView: UITableView!
    
    var recentTransactionArr: [HomeRecentTransactionCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getData()
        recentTransactionsTableView.layer.cornerRadius = 8
        
    }
    
    private func setupTableView() {
        recentTransactionsTableView.delegate = self
        recentTransactionsTableView.dataSource = self
        recentTransactionsTableView.register(UINib(nibName: "HomeRecentTransactionTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeRecentTransactionTableViewCell")
    }
    
    private func getData() {
        let recentTransactionArr: [HomeRecentTransactionCellModel] = [
            HomeRecentTransactionCellModel(cardTypeImage: UIImage(named: "visa")!, name: "Ahmed", cardTypeName: "MasterCard", lastFourNumbers: "0012", date: "Today 11:00", transactionType: "Recived", amount: "$ 1000"),
            
            HomeRecentTransactionCellModel(cardTypeImage: UIImage(named: "visa")!, name: "Hany Shouman", cardTypeName: "MasterCard", lastFourNumbers: "8452", date: "Today 12:00", transactionType: "Recived", amount: "$ 5000"),
            
            HomeRecentTransactionCellModel(cardTypeImage: UIImage(named: "visa")!, name: "Ahmed", cardTypeName: "MasterCard", lastFourNumbers: "0012", date: "Today 11:00", transactionType: "Recived", amount: "$ 1000"),
            HomeRecentTransactionCellModel(cardTypeImage: UIImage(named: "visa")!, name: "Ahmed", cardTypeName: "MasterCard", lastFourNumbers: "0012", date: "Today 11:00", transactionType: "Recived", amount: "$ 1000"),
            HomeRecentTransactionCellModel(cardTypeImage: UIImage(named: "visa")!, name: "Ahmed", cardTypeName: "MasterCard", lastFourNumbers: "0012", date: "Today 11:00", transactionType: "Recived", amount: "$ 1000")
        ]
        
        self.recentTransactionArr = recentTransactionArr
    }
    
    @IBAction func notificationBtnPressed(_ sender: UIButton) {
        print("Open Notification")
    }
    
    @IBAction func transferBtnPressed(_ sender: UIButton) {
        if let tabBarController = self.tabBarController {
            tabBarController.selectedIndex = 1
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let rootViewController = windowScene.windows.first?.rootViewController as? UITabBarController {
                rootViewController.selectedIndex = 1
            }
        }
    }
    
    @IBAction func transactionBtnPressed(_ sender: UIButton) {
        if let tabBarController = self.tabBarController {
            tabBarController.selectedIndex = 2
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let rootViewController = windowScene.windows.first?.rootViewController as? UITabBarController {
                rootViewController.selectedIndex = 2
            }
        }
    }
    
    @IBAction func cardsBtnPressed(_ sender: UIButton) {
        print("Open Cards")
    }
    
    @IBAction func accountBtnPressed(_ sender: UIButton) {
        print("Open Accounts")
        
    }
    
    @IBAction func viewAllBtnPressed(_ sender: UIButton) {
        if let tabBarController = self.tabBarController {
            tabBarController.selectedIndex = 2
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let rootViewController = windowScene.windows.first?.rootViewController as? UITabBarController {
                rootViewController.selectedIndex = 2
            }
        }
    }
}


extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentTransactionArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = recentTransactionsTableView.dequeueReusableCell(withIdentifier: "HomeRecentTransactionTableViewCell", for: indexPath) as? HomeRecentTransactionTableViewCell else {
            return UITableViewCell()
        }
        
        let transaction = recentTransactionArr[indexPath.row]
        cell.configureCell(transaction)
        
        return cell
    }
    
    
}
