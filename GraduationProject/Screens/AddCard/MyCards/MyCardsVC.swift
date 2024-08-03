//
//  MyCardsVC.swift
//  GraduationProject
//
//  Created by 1234 on 03/08/2024.
//

import UIKit

class MyCardsVC: UIViewController {

    @IBOutlet weak var addNewAccountBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: CellsNames.myCardsCell, bundle: nil), forCellReuseIdentifier: CellsNames.myCardsCell)
        // Do any additional setup after loading the view.
    }
    
    
}
extension MyCardsVC: UITableViewDelegate,UITableViewDataSource{
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsNames.myCardsCell, for: indexPath) as! MyCardsCell
         
         cell.layer.cornerRadius = 10.0
         cell.layer.masksToBounds = true
        return cell
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
  
    
}
