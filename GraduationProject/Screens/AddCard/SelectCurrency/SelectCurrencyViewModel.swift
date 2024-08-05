//
//  SelectCurrencyViewModel.swift
//  GraduationProject
//
//  Created by 1234 on 04/08/2024.
//

import Foundation
protocol SelectCurrencyViewModelProtocol{
    func getCurrenciesCount()->Int
    func getCurrencyAtIndex(_ index: Int)->Currency
    func getSelectedRow(index: Int)
    func fetchCurrency()
    func goToAddCard()
    var showError: ((_ title: String, _ message: String)->Void )? { get set  }
    var updateView: (()->Void)? {get set}
    var currencySelected: (()->Void )? {get set}

}
class SelectCurrencyViewModel: SelectCurrencyViewModelProtocol {
    var showError: ((_ title: String, _ message: String)->Void )?
    var updateView: (()->Void)?
    var currencySelected: (()->Void )?
    var currencies:[Currency] = []
    var selectedCurrencyName: String?
    init(){
    }
    func fetchCurrency(){
        GetCurrenciesAPIManager.getCurrencies(completion: {
            error, currencies in
            if let error = error {
                self.showError?("Sorry",error.localizedDescription)
            }
            if let currencies = currencies {
                self.currencies = currencies
                self.updateView?()
            }
            
        })
        
    }
    
    func getCurrenciesCount()->Int{
        return currencies.count
    }
    func getCurrencyAtIndex(_ index: Int)->Currency{
        return currencies[index]
    }
    func getSelectedRow(index: Int) {
        selectedCurrencyName = currencies[index].currencies?.first?.value.name
    }
    func goToAddCard(){
        if let _ = selectedCurrencyName{
           currencySelected?()
        }else{
            showError?("Sorry","you must select Currency")
        }
    }
    
}
