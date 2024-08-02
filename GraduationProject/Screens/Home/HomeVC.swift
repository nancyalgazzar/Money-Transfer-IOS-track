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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
