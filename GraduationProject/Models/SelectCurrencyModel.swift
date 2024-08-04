//
//  SelectCurrencyModel.swift
//  GraduationProject
//
//  Created by 1234 on 04/08/2024.
//

import Foundation

struct Currency:Codable{
    let flags: Flags
    let currencies: [String: CurrencyName]?
}
struct CurrencyName:Codable{
    let name: String
}
