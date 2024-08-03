//
//  ProfileInfoTVC.swift
//  GraduationProject
//
//  Created by 1234 on 01/08/2024.
//

import UIKit

class ProfileInfoTVC: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        tableView.isUserInteractionEnabled = false
        navigationItem.title = "Profile information"
        tableView.register(UINib(nibName: CellsNames.profileInfoCell, bundle: nil), forCellReuseIdentifier: CellsNames.profileInfoCell)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ProfileInfoConstData().getNamesCount()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsNames.profileInfoCell, for: indexPath) as! ProfileInfoCell

        cell.configCell(name: ProfileInfoConstData().getEntryOfIndex(indexPath.row), value: "dummy data")
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
   
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
