//
//  GetChangeRateAPIManager.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 05/08/2024.
//

import Foundation
import Alamofire

class GetChangeRateAPIManager {
    static func getExchangeRate(from baseCurrency: String, to targetCurrency: String, completion: @escaping (_ error: Error?, _ exchangeRate: Double?)->Void) {
        let urlString = "https://v6.exchangerate-api.com/v6/eaed7189a1c1e65d6113d216/latest/\(baseCurrency)"
        AF.request(urlString, method: .get).response { response in
            debugPrint(response)
            guard response.error == nil else {
                debugPrint(response.error ?? "error response")
                completion(response.error, nil)
                return
            }
            guard let data = response.data else {
                debugPrint("Can't get data")
                completion(nil, nil)
                return
            }
            do {
                let changeRate = try JSONDecoder().decode(ChangeRate.self, from: data)
                let exchangeRate = changeRate.conversionRates[targetCurrency]
                completion(nil, exchangeRate)
            } catch let error {
                print(error.localizedDescription)
                completion(error, nil)
            }
        }
    }
}
