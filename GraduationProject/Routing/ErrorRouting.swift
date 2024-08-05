//
//  ErrorRouting.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 05/08/2024.
//

import UIKit

struct ErrorRouting {
    static func goToInternetConnectionError(VC: UIViewController) {
        let internetConnectionErrorVC = InternetConnectionErrorVC()
        VC.navigationController?.pushViewController(internetConnectionErrorVC, animated: true)
    }
    
    static func goToServerError(VC: UIViewController) {
        let serverErrorVC = ServerErrorVC()
        VC.navigationController?.pushViewController(serverErrorVC, animated: true)
    }
}
