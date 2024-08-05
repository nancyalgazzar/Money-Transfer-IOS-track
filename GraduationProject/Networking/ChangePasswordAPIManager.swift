//
//  ChangePasswordAPIManager.swift
//  GraduationProject
//
//  Created by 1234 on 05/08/2024.
//

import Foundation
import Alamofire
class ChangePasswordAPIManager {
    static func changePassword(oldPassword: String, newPassword: String,completion: @escaping (_ error: Error?, _ message: String?)->Void){
        guard let token = UserDefaultsManager.share().token else{
            completion(nil, nil)
            return
        }
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Content-Type": "application/json"
        ]
        let body = [
            "oldPassword": oldPassword,
            "newPassword": newPassword]
        AF.request("https://e8c8-156-223-19-253.ngrok-free.app/api/updatePassword", method: .put, parameters: body, encoder: JSONParameterEncoder.default, headers: headers).responseString{ response in
            debugPrint(response)
            guard response.error == nil else {
                debugPrint(response.error ?? "error response")
                completion(response.error,nil)
                return
            }
            switch response.result {
            case .success(let data):
                    print(data)
                    completion(nil, data)
            case .failure(let error):
                completion(error, nil)
            }
        }
    }
}
