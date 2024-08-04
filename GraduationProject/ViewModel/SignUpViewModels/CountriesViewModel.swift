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
}

class CountriesViewModel: CountriesViewModelProtocol{
    var countries: [CountryModel] = []
    let countriesViewProtocol: CountriesViewProtocol
    init (_ countriesProtocol: CountriesViewProtocol){
        self.countriesViewProtocol = countriesProtocol
    }
    func fetchCountries( completion:@escaping()->()) {
        GetCountriesAPIManager.getCountries(completion: {
            error, fetchedCountries in
            if let error = error {
                self.countriesViewProtocol.displayErrorMessage(title: "Sorry", message: error.localizedDescription)
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
