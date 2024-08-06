//
//  TransferAPiManager.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 06/08/2024.
//

import Foundation
import Alamofire

class TransferAPIManager {
    static func makeTransfer(senderAccountId: Int, recipientAccountId: Int, amount: Double, currency: String, status: String, description: String, completion: @escaping (_ error: Error?, _ response: TransferResponse?)->Void) {
        let url = "https://e8c8-156-223-19-253.ngrok-free.app/api/transfer"
        
        let parameters: [String: Any] = [
            "senderAccountId": senderAccountId,
            "recipientAccountId": recipientAccountId,
            "amount": amount,
            "currency": currency,
            "status": status,
            "description": description
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: TransferResponse.self) { response in
            if let data = response.data, !data.isEmpty {
                switch response.result {
                case .success(let data):
                    completion(nil, data)
                case .failure(let error):
                    completion(error, nil)
                }
            } else {
                let statusCode = response.response?.statusCode ?? 0
                print("Request failed with status code: \(statusCode)")
                print("Response: \(String(describing: response.response))")
                completion(NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "Empty response from server"]), nil)
            }
        }
    }
}


