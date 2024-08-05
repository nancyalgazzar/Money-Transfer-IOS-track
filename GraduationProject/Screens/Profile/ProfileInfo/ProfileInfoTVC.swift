//
//  ProfileInfoTVC.swift
//  GraduationProject
//
//  Created by 1234 on 01/08/2024.
//

import UIKit

class ProfileInfoTVC: UITableViewController {
    var profileInfoViewModel: ProfileInfoViewModelProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileInfoViewModel = ProfileInfoViewModel()
        bindViewModel()
        formateTableView()
        profileInfoViewModel.fetchData(completion: {[weak self] in
//            DispatchQueue.main.async {
//               self?.tableView.reloadData()
//            }
            self?.tableView.reloadData()

        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return profileInfoViewModel.getProfileInfoCount()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsNames.profileInfoCell, for: indexPath) as! ProfileInfoCell

        let cellData = profileInfoViewModel.getProfileDataAtIndex(indexPath.row)
        cell.configCell(name: cellData.0, value: cellData.1)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

extension ProfileInfoTVC {
    func formateTableView() {
        tableView.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        tableView.isUserInteractionEnabled = false
        navigationItem.title = "Profile information"
        tableView.register(UINib(nibName: CellsNames.profileInfoCell, bundle: nil), forCellReuseIdentifier: CellsNames.profileInfoCell)
    }
}
extension ProfileInfoTVC{
    func bindViewModel(){
        profileInfoViewModel.showError = {title, message in
            self.alertMessage(title: title, message: message)
        }
    }
}
