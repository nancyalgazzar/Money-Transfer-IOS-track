//
//  SignInAPIManager.swift
//  GraduationProject
//
//  Created by 1234 on 05/08/2024.
//

import Foundation
import Alamofire
class SignInAPIManager {
    
    static func signIn(email: String, password:String, completion:@escaping(_ error: Error?,_ token: String?)->()){
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        let body = [
            "email": email,
            "password": password]
        print(password)
        AF.request("https://e8c8-156-223-19-253.ngrok-free.app/api/login", method: .post, parameters: body, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            debugPrint(response)
            guard response.error == nil else {
                debugPrint(response.error ?? "error response")
                completion(response.error,nil)
                return
            }
            switch response.result {
            case .success(let data):
                do{
                guard let data = data else{return}
                let json = try JSONDecoder().decode(tokenDecode.self, from: data)
                    print(json.token)
                    completion(nil, json.token)
                }catch{}
            case .failure(let error):
                completion(error, nil)
            }
        }
    }
}
