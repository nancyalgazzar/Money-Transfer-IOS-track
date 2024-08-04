//
//  NotificationRouting.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 04/08/2024.
//

import UIKit

struct NotificationRouting {
    static func goToNotifications(VC: UIViewController) {
        let notificationVC = NotificationsVC()
        VC.navigationController?.pushViewController(notificationVC, animated: true)
    }
}
