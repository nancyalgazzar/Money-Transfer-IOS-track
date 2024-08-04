//
//  CountriesModel.swift
//  GraduationProject
//
//  Created by 1234 on 04/08/2024.
//

import Foundation
struct CountryModel: Codable{
    let name: Name
    let flags: Flags
}
struct Name: Codable{
    let common: String
}
struct Flags: Codable{
    let png: String
    let svg: String
}
