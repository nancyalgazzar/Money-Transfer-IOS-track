//
//  TransferRouting.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 04/08/2024.
//

import UIKit

struct TransferRouting {
    static func goToTransfer(tabBarController: UITabBarController?) {
        if let tabBarController = tabBarController {
            tabBarController.selectedIndex = 1
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootViewController = windowScene.windows.first?.rootViewController as? UITabBarController {
                rootViewController.selectedIndex = 1
            }
        }
    }
    
    static func goToTransferConfirmation(VC: UIViewController) {
        let transferConfirmationVC = TransferConfirmationVC()
        VC.navigationController?.pushViewController(transferConfirmationVC, animated: true)
    }
    
    static func goToTransferPayment(VC: UIViewController) {
        let transferPaymentVC = TransferPaymentVC()
        VC.navigationController?.pushViewController(transferPaymentVC, animated: true)
    }
    
    static func goToTransferSelectCurruncy(VC: UIViewController) {
        let transferSelectCurruncyVC = TransferSelectCurruncyVC()
        VC.navigationController?.pushViewController(transferSelectCurruncyVC, animated: true)
    }

}

