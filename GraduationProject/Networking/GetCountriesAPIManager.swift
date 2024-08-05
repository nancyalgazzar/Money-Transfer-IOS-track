//
//  GetCountriesAPIManager.swift
//  GraduationProject
//
//  Created by 1234 on 04/08/2024.
//

import Foundation
import Alamofire
class GetCountriesAPIManager{
    
    static func getCountries(completion: @escaping (_ error: Error?, _ countries: [CountryModel]?)->Void){
        AF.request("https://restcountries.com/v3.1/all", method: .get).response{ response in
//            debugPrint(response)
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
                let Countries = try JSONDecoder().decode([CountryModel].self, from: data)
                completion(nil, Countries)
//                for country in Countries {
//                    print(country.flags.png)
//                }
            } catch let error {
//                print(error.localizedDescription)
                completion(error, nil)
            }
        }
    }
}
