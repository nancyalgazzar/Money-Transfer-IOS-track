//
//  SelectCurrencyVC.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit

class SelectCurrencyVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SetTableView()
        registerCell()
        navigationItemFormat()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getStartedBtn(_ sender: UIButton) {
        AddCardRouting.goToAddNewCard(VC: self)
    }
}
//MARK: Table View
extension SelectCurrencyVC: UITableViewDelegate,UITableViewDataSource {
    private func SetTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func registerCell(){
        
        tableView.register(UINib(nibName: "CountryViewCell", bundle: nil), forCellReuseIdentifier: "CountryViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 35
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryViewCell", for: indexPath) as! CountryViewCell
         // config cell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
    }
}


//MARK: cancel Button
extension SelectCurrencyVC{
    private func navigationItemFormat(){
        let rightButton  = UIBarButtonItem(title:"cancel", style: .plain, target: self, action: #selector(cancelTransfer))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.title = "Select Currency"
    }
    @objc private func cancelTransfer(){
        navigationController?.popViewController(animated: true)
    }
}
