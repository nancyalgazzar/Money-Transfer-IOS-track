//
//  SelectCurrencyViewModel.swift
//  GraduationProject
//
//  Created by 1234 on 04/08/2024.
//

import Foundation
protocol SelectCurrencyModelProtocol{
    func getCurrenciesCount()->Int
    func getCurrencyAtIndex(_ index: Int)->Currency
    func getSelectedRow(index: Int)
    func goToAddCard()
}
class SelectCurrencyViewModel: SelectCurrencyModelProtocol {
    var currencies:[Currency] = []
    var selectedCurrencyName: String?
    let selectCurrencyProtocol: SelectCurrencyProtocol
    init(_ selectCurrency: SelectCurrencyProtocol){
        selectCurrencyProtocol = selectCurrency
        fetchCurrency()
    }
    func fetchCurrency(){
        GetCurrenciesAPIManager.getCurrencies(completion: {
            error, currencies in
            if let error = error {
                self.selectCurrencyProtocol.displayErrorMessage(title: "Sorry", message: error.localizedDescription)            }
            if let currencies = currencies {
                self.currencies = currencies
                self.selectCurrencyProtocol.reloadTable()
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
            selectCurrencyProtocol.goToAddCard()
        }else{
            selectCurrencyProtocol.displayErrorMessage(title: "Sorry", message: "you must select Currency")
        }
    }
}
