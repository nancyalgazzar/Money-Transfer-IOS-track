//
//  HomeRouting.swift
//  GraduationProject
//
//  Created by 1234 on 03/08/2024.
//

import UIKit
struct HomeRouting{
    static func goToHome(VC: UIViewController){
        let selectCurrency = TapBarVC()
        VC.navigationController?.pushViewController(selectCurrency, animated: true)
    }
}
