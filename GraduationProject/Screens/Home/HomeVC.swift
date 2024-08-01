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
        setUpScreen()
        
    }
}

extension HomeVC {
    private func setUpScreen() {
        profilePicView.backgroundColor = .gray
        toCircle(view: &profilePicView)
        roundedCorners(view: &curruntBalanceView, radius: 8)
        roundedCorners(view: &servicesView, radius: 8)
        recentTransactionsTableView.layer.cornerRadius = 8
    }
}
