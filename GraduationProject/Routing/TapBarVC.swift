//
//  TabBarVC.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 02/08/2024.
//

import UIKit

class TapBarVC: UITabBarController {
    
    //MARK: - Properties
    let homeNavigation = UINavigationController()
    let transferNavigation = UINavigationController()
    let transactionNavigation = UINavigationController()
    let myCardNavigation = UINavigationController()
    let moreNavigation = UINavigationController()
    
//MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers()
        setupTabBarView()
    }
}


//MARK: - Private Methods
extension TapBarVC {
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
        homeVC.tabBarItem.title = "Home"
        homeNavigation.viewControllers = [homeVC]
    }
    
    private func setTransferTab() {
        let transferVC = TransferVC()
        transferVC.tabBarItem.image = #imageLiteral(resourceName: "Transfer 1")
        transferVC.tabBarItem.title = "Transfer"
        transferNavigation.viewControllers = [transferVC]
    }
    
    private func setTransactionTab() {
        let transactionVC = TransactionVC()
        transactionVC.tabBarItem.image = #imageLiteral(resourceName: "History 1")
        transactionVC.tabBarItem.title = "Transaction"
        transactionNavigation.viewControllers = [transactionVC]
    }
    
    private func setMyCardsTab() {
        let myCardsVC = MyCardsVC()
        myCardsVC.tabBarItem.image = #imageLiteral(resourceName: "Cards 1")
        myCardsVC.tabBarItem.title = "My Cards"
        myCardNavigation.viewControllers = [myCardsVC]
    }
    
    private func setMoreTab() {
        let profileVC = ProfileVC()
        profileVC.tabBarItem.image = #imageLiteral(resourceName: "More 1")
        profileVC.tabBarItem.title = "More"
        moreNavigation.viewControllers = [profileVC]
    }

    
    private func setViewControllers() {
        setHomeTab()
        setTransferTab()
        setTransactionTab()
        setMyCardsTab()
        setMoreTab()
        
        
        self.viewControllers = [homeNavigation, transferNavigation, transactionNavigation, myCardNavigation, moreNavigation]
        self.selectedIndex = 0
        for vc in self.viewControllers! {
            vc.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        }
    }
}
