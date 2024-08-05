//
//  GetProfileInfoAPIManager.swift
//  GraduationProject
//
//  Created by 1234 on 05/08/2024.
//

import Foundation
import Alamofire

class GetProfileInfoAPIManager{
    
    static func getProfileInfo(completion: @escaping (_ error: Error?, _ profileInfo: ProfileInfoModel?)->Void){
        AF.request("", method: .get).response{ response in
            debugPrint(response)
            guard response.error == nil else {
                debugPrint(response.error ?? "error response")
                completion(response.error,nil)
                return
            }
            guard let data = response.data else {
                debugPrint("cant get data")
                completion(nil, nil)
                return
            }
            do {
                let profileInfo = try JSONDecoder().decode(ProfileInfoModel.self, from: data)
                completion(nil, profileInfo)
//                debugPrint(profileInfo.firstName)
            } catch let error {
                print(error.localizedDescription)
                completion(error, nil)
            }
        }
    }
}
