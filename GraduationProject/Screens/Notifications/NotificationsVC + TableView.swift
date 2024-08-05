//
//  NotificationsVC + TableView.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 05/08/2024.
//

import UIKit

extension NotificationsVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        notificationsTableView.delegate = self
        notificationsTableView.dataSource = self
        registerCells()
    }
    
    private func registerCells() {
        notificationsTableView.register(UINib(nibName: CellsNames.notificationCell, bundle: nil), forCellReuseIdentifier: CellsNames.notificationCell)
    }
    
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
