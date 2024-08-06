//
//  SignUpAPIManger.swift
//  GraduationProject
//
//  Created by 1234 on 05/08/2024.
//

import Foundation
import Alamofire
class SignUpAPIManager {
    static func signUp( user: UserModel,completion: @escaping(_ error:Error?, _ status: Bool,_ message: String?)->Void ){
        do {
            let jsonData = try JSONEncoder().encode(user)
            var request  = URLRequest(url: URL(string: "https://e8c8-156-223-19-253.ngrok-free.app/api/register")!)
            request.httpMethod  = HTTPMethod.post.rawValue
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            AF.request(request).response{
                response in
                switch response.result {
                case .success(let value):
                    if let code  = response.response?.statusCode, code == 200{
                        completion(nil, true,nil)
                        print(value ?? "cant be printed")//to get token
                         return
                    }
                    completion(nil, false, "Error in data decoding")

                case .failure(let error):
                    completion(error, false, nil)
                }
            }
        
        } catch  {
            completion(nil, false, "unknown error")
        }

    }
}
