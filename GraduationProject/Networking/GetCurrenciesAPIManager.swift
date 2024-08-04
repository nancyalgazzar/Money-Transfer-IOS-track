//
//  GetCurrenciesAPIManager.swift
//  GraduationProject
//
//  Created by 1234 on 04/08/2024.
//

import Foundation
import Alamofire
class GetCurrenciesAPIManager{
    
    static func getCurrencies(completion: @escaping (_ error: Error?, _ countries: [Currency]?)->Void){
        AF.request("https://restcountries.com/v3.1/all", method: .get).response{ response in
            debugPrint(response)
            guard response.error == nil else {
                debugPrint(response.error ?? "error response")
                completion(response.error,nil)
                return
            }
            guard let data = response.data else {
                debugPrint("cant get data")
                completion(nil, nil)
                return
            }
            do {
                let currencies = try JSONDecoder().decode([Currency].self, from: data)
                completion(nil, currencies)
//                for currency in currencies {
//                    print(currency.currencies?.first?.value.name ?? "cant beat")
//                }
            } catch let error {
                print(error.localizedDescription)
                completion(error, nil)
            }
        }
    }
}
