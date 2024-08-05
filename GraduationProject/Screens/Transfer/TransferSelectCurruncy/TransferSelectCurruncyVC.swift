//
//  TransferSelectCurruncyVC.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 05/08/2024.
//

import UIKit

class TransferSelectCurruncyVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectCurrencyViewModelProtocol: SelectCurrencyViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectCurrencyViewModelProtocol = SelectCurrencyViewModel()
        bindViewModel()
        selectCurrencyViewModelProtocol.fetchCurrency()
        SetTableView()
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Select Curruncy"
    }
    
    func bindViewModel(){
        selectCurrencyViewModelProtocol.showError = { title, message in
            DispatchQueue.main.async {
                self.alertMessage(title: title, message: message)
            }
        }
        selectCurrencyViewModelProtocol.updateView = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        selectCurrencyViewModelProtocol.currencySelected = {
            AddCardRouting.goToAddNewCard(VC: self)
        }
    }
}

extension TransferSelectCurruncyVC: UITableViewDelegate,UITableViewDataSource {
    private func SetTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func registerCell(){
        
        tableView.register(UINib(nibName: CellsNames.countryViewCell, bundle: nil), forCellReuseIdentifier: CellsNames.countryViewCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectCurrencyViewModelProtocol.getCurrenciesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsNames.countryViewCell, for: indexPath) as! CountryViewCell
         // config cell
        let cellData = selectCurrencyViewModelProtocol.getCurrencyAtIndex(indexPath.row)
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
        TransferViewModel.setCurruncy(curruncy: selectCurrencyViewModelProtocol.getCurrencyAtIndex(indexPath.row))
    }
}



