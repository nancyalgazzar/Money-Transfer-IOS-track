//
//  TabBarVC.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 02/08/2024.
//

import UIKit

class TabBarVC: UITabBarController {
    
    //MARK: - Properties
    let homeNavigation = UINavigationController()
    let transferNavigation = UINavigationController()
    let transactionNavigation = UINavigationController()
    
//MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers()
        setupTabBarView()
    }
}


//MARK: - Private Methods
extension TabBarVC {
    private func setupTabBarView() {
        tabBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
    }
    
    private func setHomeTab() {
        let homeVC = HomeVC()
        homeVC.tabBarItem.image = #imageLiteral(resourceName: "home 1")
        homeNavigation.viewControllers = [homeVC]
    }
    
    private func setTransferTab() {
        let transferVC = TransferVC()
        transferVC.tabBarItem.image = #imageLiteral(resourceName: "Transfer 1")
        transferNavigation.viewControllers = [transferVC]
    }
    
    private func setTransactionTab() {
        let transactionVC = TransactionVC()
        transactionVC.tabBarItem.image = #imageLiteral(resourceName: "History 1")
        transactionNavigation.viewControllers = [transactionVC]
    }

    
    private func setViewControllers() {
        setHomeTab()
        setTransferTab()
        setTransactionTab()
        
        self.viewControllers = [homeNavigation, transferNavigation, transactionNavigation]
        self.selectedIndex = 0
        for vc in self.viewControllers! {
            vc.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        }
    }
}
