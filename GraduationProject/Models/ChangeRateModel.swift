//
//  ChangeRateModel.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 05/08/2024.
//

import Foundation

struct ChangeRate: Codable {
    let result: String
    let timeLastUpdateUtc: String
    let timeNextUpdateUtc: String
    let baseCode: String
    let conversionRates: [String: Double]
    
    enum CodingKeys: String, CodingKey {
        case result
        case timeLastUpdateUtc = "time_last_update_utc"
        case timeNextUpdateUtc = "time_next_update_utc"
        case baseCode = "base_code"
        case conversionRates = "conversion_rates"
    }
}

