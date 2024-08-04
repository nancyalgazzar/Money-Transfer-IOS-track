//
//  CardsRouting.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 04/08/2024.
//

import UIKit

struct CardsRouting {
    static func goToCards(tabBarController: UITabBarController?) {
        if let tabBarController = tabBarController {
            tabBarController.selectedIndex = 3
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootViewController = windowScene.windows.first?.rootViewController as? UITabBarController {
                rootViewController.selectedIndex = 3
            }
        }
    }
}
