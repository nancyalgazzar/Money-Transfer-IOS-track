//
//  ChangePasswordAPIManager.swift
//  GraduationProject
//
//  Created by 1234 on 05/08/2024.
//

import Foundation
import Alamofire
class ChangePasswordAPIManager {
    static func getCountries(oldPassword: String, newPassword: String,completion: @escaping (_ error: Error?, _ success: Bool)->Void){
        let headers:HTTPHeaders = [
            "token": "",
            "content-type": "application/json"
        ]
        let body = [
            "oldPassword": oldPassword,
            "newPassword": newPassword]
        AF.request("", method: .post, parameters: body, encoder: URLEncodedFormParameterEncoder.default, headers: headers).response{ response in
            debugPrint(response)
            guard response.error == nil else {
                debugPrint(response.error ?? "error response")
                completion(response.error,false)
                return
            }
            completion(nil, true)
        }
    }
}
