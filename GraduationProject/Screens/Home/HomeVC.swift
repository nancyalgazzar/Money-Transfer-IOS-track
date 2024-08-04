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
    
    var isBalanceHidden = true
    var Balance = "$2,85,856.20"
    var recentTransactionArr: [TransactionCellModel] = []
    
    //MARK: - lifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getData()
        recentTransactionsTableView.layer.cornerRadius = 8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - private functions
    private func setupTableView() {
        recentTransactionsTableView.delegate = self
        recentTransactionsTableView.dataSource = self
        recentTransactionsTableView.register(UINib(nibName: CellsNames.recentTransactionCell, bundle: nil), forCellReuseIdentifier: CellsNames.recentTransactionCell)
    }
    
    private func getData() {
        self.recentTransactionArr = DummyTransactionData.recentTransactionArr
    }
    
    //MARK: - IB Actions
    @IBAction func notificationBtnPressed(_ sender: UIButton) {
        let notificationVC = NotificationsVC()
        navigationController?.pushViewController(notificationVC, animated: true)
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
        if let tabBarController = self.tabBarController {
            tabBarController.selectedIndex = 3
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let rootViewController = windowScene.windows.first?.rootViewController as? UITabBarController {
                rootViewController.selectedIndex = 3
            }
        }
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
    @IBAction func hideBtnPressed(_ sender: UIButton) {
        if isBalanceHidden {
            curruntBalanceTextFilled.text = Balance
            hideBtnView.setImage(UIImage(named: "close-eye"), for: .normal)
            isBalanceHidden = false
        } else if !isBalanceHidden {
            curruntBalanceTextFilled.text = "********"
            hideBtnView.setImage(UIImage(named: "Open-eye"), for: .normal)
            isBalanceHidden = true
        }
    }
}


//MARK: - tableView functions
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentTransactionArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = recentTransactionsTableView.dequeueReusableCell(withIdentifier: CellsNames.recentTransactionCell, for: indexPath) as? HomeRecentTransactionTableViewCell else {
            return UITableViewCell()
        }
        
        let transaction = recentTransactionArr[indexPath.row]
        cell.configureCell(transaction)
        
        return cell
    }
}
