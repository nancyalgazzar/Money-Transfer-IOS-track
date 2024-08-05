//
//  NotificationsVC.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 01/08/2024.
//

import UIKit

class NotificationsVC: UIViewController {

    @IBOutlet weak var notificationsTableView: UITableView!
    
    var notificationArr = [1, 2, 3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        self.title = "Notifications"
        navigationItem.hidesBackButton = false
    }
}

