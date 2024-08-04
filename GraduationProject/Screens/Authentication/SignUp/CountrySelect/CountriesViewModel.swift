//
//  CountriesViewModel.swift
//  GraduationProject
//
//  Created by 1234 on 04/08/2024.
//

import Foundation
protocol CountriesViewModelProtocol{
    func getCountriesCount()->Int
    func getCountryOfIndex(index: Int)-> CountryModel
    func fetchCountries(completion:@escaping()->())
    var showError: ((_ title: String, _ message : String)-> Void)? {get set}
}

class CountriesViewModel: CountriesViewModelProtocol{
    var countries: [CountryModel] = []
    var showError: ((_ title: String, _ message : String)-> Void)?   
    func fetchCountries( completion:@escaping()->()) {
        GetCountriesAPIManager.getCountries(completion: {
            error, fetchedCountries in
            if let error = error {
                self.showError?("Sorry", error.localizedDescription)
            }
            if let fetchedCountries = fetchedCountries {
                self.countries = fetchedCountries
            }
            completion()
        })
    }
    func getCountriesCount()->Int{
        return countries.count
    }
    func getCountryOfIndex(index: Int)-> CountryModel {
        return countries[index]
    }
}
