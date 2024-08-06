//
//  ProfileVC.swift
//  GraduationProject
//
//  Created by 1234 on 01/08/2024.
//

import UIKit

class ProfileVC: UIViewController {

    
    @IBOutlet weak var avatarLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var logOutBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var profileViewModel: ProfileViewModelProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileViewModel = ProfileViewModel()
        bindViewModel()
        initTableView()
        tableView.backgroundColor = .clear
        navigationItem.title = "Profile"
        avatarLabel.layer.cornerRadius = avatarLabel.frame.size.height / 2
        avatarLabel.clipsToBounds = true
        avatarLabel.text = "AD"
        tableView.register(UINib(nibName: CellsNames.profileCell, bundle: nil ), forCellReuseIdentifier: CellsNames.profileCell)
        setButton()
    }
    func setButton(){
        let image =  UIImage(named: "logout 1")
        logOutBtn.setImage(image, for: .normal)
        logOutBtn.semanticContentAttribute = .forceLeftToRight
        logOutBtn.contentHorizontalAlignment = .left
    }
    @IBAction func logOutBttnAction(_ sender: UIButton) {
        profileViewModel.logOut()
    }
}
extension ProfileVC: UITableViewDelegate,UITableViewDataSource {
    private func initTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ProfileGeneralConstData().getGeneralListCount()
     }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsNames.profileCell, for: indexPath) as! ProfileCell
        
        cell.configCell(cellData: ProfileGeneralConstData().getDataOfIndex(indexPath.row))
        // Configure the cell...

        return cell
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProfileGeneralConstData().getVCNameOfIndex(indexPath.row)
         ProfileRouting.navigateBetweenScreens(self, and: vc)
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
extension ProfileVC {
    func bindViewModel(){
        profileViewModel.showError = {title, message in
            self.alertMessage(title: title, message: message)
        }
        profileViewModel.goToSignIn = {
            guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return}
            delegate.setLogInRoot()
        }
    }
    
}
