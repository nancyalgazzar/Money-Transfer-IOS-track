//
//  EditProfileAPIManager.swift
//  GraduationProject
//
//  Created by 1234 on 05/08/2024.
//

import Foundation
import Alamofire
class EditProfileAPIManager{
    
    static func editProfile( profileData: EditProfileModel,completion: @escaping(_ error:Error?, _ status: Bool)->Void ){
        do {
            let jsonData = try JSONEncoder().encode(profileData)
            var request  = URLRequest(url: URL(string: "")!)
            request.httpMethod  = HTTPMethod.post.rawValue
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer ..", forHTTPHeaderField: "Authorization")
            request.httpBody = jsonData
            AF.request(request).response{
                response in
                switch response.result {
                case .success(let value):
                    print(value as Any)
                    completion(nil, true)
                case .failure(let error):
                    completion(error, false)
                }
            }
        
        } catch  {
            completion(nil, false)
        }

    }
}
