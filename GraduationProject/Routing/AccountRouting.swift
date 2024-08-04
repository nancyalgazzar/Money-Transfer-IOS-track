//
//  AccountRouting.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 04/08/2024.
//

import UIKit

struct AccountRouting {
    static func goToAccounts(tabBarController: UITabBarController?) {
        if let tabBarController = tabBarController {
            tabBarController.selectedIndex = 4
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootViewController = windowScene.windows.first?.rootViewController as? UITabBarController {
                rootViewController.selectedIndex = 4
            }
        }
    }
}
