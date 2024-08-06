//
//  TransactionsAPIManager.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 06/08/2024.
//

import Foundation
import Alamofire

class TransactionsAPIManager {
    static func getTransactions(customerId: Int, completion: @escaping (Result<[TransactionCellModel], Error>) -> Void) {
        let url = "https://e8c8-156-223-19-253.ngrok-free.app/api/customer/1"
        
        AF.request(url, method: .get).responseDecodable(of: [TransactionCellModel].self) { response in
            switch response.result {
            case .success(let transactions):
                completion(.success(transactions))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
