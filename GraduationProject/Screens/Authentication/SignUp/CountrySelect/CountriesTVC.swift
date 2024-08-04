//
//  CountriesTVC.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit
protocol CountriesViewProtocol:DisplayErrorMessageProtocol{
    
}

class CountriesTVC: UITableViewController, CountriesViewProtocol {
        
    var isCompleted: (( _ selectedCountry: String)->())? = nil
    var countriesViewModel: CountriesViewModelProtocol!
    func didSelectCountry(completed: @escaping(_ selectedCountry: String)->() ){
        self.isCompleted = completed
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        countriesViewModel = CountriesViewModel(self)
        countriesViewModel.fetchCountries(completion: {[weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        })
        tableView.register(UINib(nibName: CellsNames.countryViewCell, bundle: nil), forCellReuseIdentifier: CellsNames.countryViewCell)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countriesViewModel.getCountriesCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsNames.countryViewCell, for: indexPath) as! CountryViewCell

        // Configure the cell...
        print(countriesViewModel.getCountryOfIndex(index: indexPath.row))
        cell.configCell(country: countriesViewModel.getCountryOfIndex(index: indexPath.row))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let completed = isCompleted {
            let name = countriesViewModel.getCountryOfIndex(index: indexPath.row).name.common
            completed(name)
        }
    }
}
extension CountriesTVC{
    func displayErrorMessage(title: String, message:String){
        alertMessage(title: title, message: message)
    }
}
