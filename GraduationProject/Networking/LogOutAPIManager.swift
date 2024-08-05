//
//  LogOutAPIManager.swift
//  GraduationProject
//
//  Created by 1234 on 06/08/2024.
//

import Foundation
import Alamofire

class LogOutAPIManager {
    static func logOut(completion:@escaping (_ error: Error?, _ status: Bool)->()){
        let headers:HTTPHeaders = [
            "Authorization": "Bearer ..",
            "Content-Type": "application/json"
        ]
        AF.request("", method: .post, headers: headers).response{ response in
            debugPrint(response)
            guard response.error == nil else {
                debugPrint(response.error ?? "error response")
                completion(response.error,false)
                return
            }
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                    debugPrint(json)
                    completion(nil, true)
                } catch {
                    completion(nil, false)
                }
            case .failure(let error):
                completion(error, false)
            }
        }
        
    }
}
