//
//  GetChangeRateAPIManager.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 05/08/2024.
//

import Foundation
import Alamofire

class GetChangeRateAPIManager {
    static func getCurrencies(completion: @escaping (_ error: Error?, _ changeRate: ChangeRate?)->Void){
        AF.request("https://v6.exchangerate-api.com/v6/eaed7189a1c1e65d6113d216/latest/USD", method: .get).response{ response in
            debugPrint(response)
            guard response.error == nil else {
                debugPrint(response.error ?? "error response")
                completion(response.error, nil)
                return
            }
            guard let data = response.data else {
                debugPrint("cant get data")
                completion(nil, nil)
                return
            }
            do {
                let changeRate = try JSONDecoder().decode(ChangeRate.self, from: data)
                completion(nil, changeRate)
                print(changeRate.conversionRates)
            } catch let error {
                print(error.localizedDescription)
                completion(error, nil)
            }
        }
    }
}
