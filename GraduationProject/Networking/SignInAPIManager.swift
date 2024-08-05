//
//  SignInAPIManager.swift
//  GraduationProject
//
//  Created by 1234 on 05/08/2024.
//

import Foundation
import Alamofire
class SignInAPIManager {
    
    static func signIn(email: String, password:String, completion:@escaping(_ error: Error?,_ status: Bool)->()){
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        let body = [
            "email": email,
            "password": password]
        AF.request("", method: .post, parameters: body, encoder: URLEncodedFormParameterEncoder.default, headers: headers).response{ response in
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
