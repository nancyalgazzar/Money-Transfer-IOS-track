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
    
    private func setupTableView() {
        notificationsTableView.delegate = self
        notificationsTableView.dataSource = self
        notificationsTableView.register(UINib(nibName: CellsNames.notificationCell, bundle: nil), forCellReuseIdentifier: CellsNames.notificationCell)
    }
}

extension NotificationsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return notificationArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = notificationsTableView.dequeueReusableCell(withIdentifier: CellsNames.notificationCell, for: indexPath) as? NotificationTableViewCell else {
            return UITableViewCell()
        }
        
//        let notification = notificationArr[indexPath.section]
//        cell.configureCell(notification)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
    }
}
