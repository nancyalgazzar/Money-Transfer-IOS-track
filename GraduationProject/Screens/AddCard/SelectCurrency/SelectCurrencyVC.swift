//
//  SelectCurrencyVC.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit

protocol SelectCurrencyProtocol:DisplayErrorMessageProtocol{
    func reloadTable()
    func goToAddCard()
}
class SelectCurrencyVC: UIViewController {
    
    var selectCurrencyModelProtocol: SelectCurrencyModelProtocol!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        selectCurrencyModelProtocol = SelectCurrencyViewModel(self)
        SetTableView()
        registerCell()
        navigationItemFormat()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getStartedBtn(_ sender: UIButton) {
        selectCurrencyModelProtocol.goToAddCard()
    }
}
//MARK: Table View
extension SelectCurrencyVC: UITableViewDelegate,UITableViewDataSource {
    private func SetTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func registerCell(){
        
        tableView.register(UINib(nibName: CellsNames.countryViewCell, bundle: nil), forCellReuseIdentifier: CellsNames.countryViewCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectCurrencyModelProtocol.getCurrenciesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsNames.countryViewCell, for: indexPath) as! CountryViewCell
         // config cell
        let cellData = selectCurrencyModelProtocol.getCurrencyAtIndex(indexPath.row)
        cell.configCell(country: cellData)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor(hex: "#F3E9EB")
        return indexPath
    }
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = .clear
        return indexPath
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectCurrencyModelProtocol.getSelectedRow(index: indexPath.row)
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
extension SelectCurrencyVC: SelectCurrencyProtocol{
    func reloadTable(){
        tableView.reloadData()
    }
    func displayErrorMessage(title: String, message: String){
        alertMessage(title: title, message: message)
    }
    func goToAddCard(){
        AddCardRouting.goToAddNewCard(VC: self)

    }
}
