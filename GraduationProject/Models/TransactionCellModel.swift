//
//  HomeRecentTransactionCellModel.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 02/08/2024.
//

import UIKit

struct TransactionCellModel: Decodable {
    let name: String
    let cardTypeName: String
    let lastFourNumbers: String
    let date: String
    let transactionType: String
    let amount: String
    let isSuccessful: Bool
}
