//
//  TransactionRouting.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 04/08/2024.
//

import UIKit

struct TransactionRouting {
    static func goToTransactions(tabBarController: UITabBarController?) {
        if let tabBarController = tabBarController {
            tabBarController.selectedIndex = 2
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootViewController = windowScene.windows.first?.rootViewController as? UITabBarController {
                rootViewController.selectedIndex = 2
            }
        }
    }
    
    static func goToTransactionDetails(VC: UIViewController) {
        let transactionDetailsVC = TransactionDetailsVC()
        VC.navigationController?.pushViewController(transactionDetailsVC, animated: true)
        
    }
}
