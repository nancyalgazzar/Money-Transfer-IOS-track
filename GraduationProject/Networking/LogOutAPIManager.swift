//
//  LogOutAPIManager.swift
//  GraduationProject
//
//  Created by 1234 on 06/08/2024.
//

import Foundation
import Alamofire

class LogOutAPIManager {
    static func logOut(completion:@escaping (_ error: Error?, _ message: String?)->()){
        guard let token = UserDefaultsManager.share().token else{
            completion(nil, "Error you are not signed in")
            return
        }
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Content-Type": "application/json"
        ]
        AF.request("https://e8c8-156-223-19-253.ngrok-free.app/api/logout", method: .post, headers: headers).responseData{ response in
            debugPrint(response)
            guard response.error == nil else {
                debugPrint(response.error ?? "error response")
                completion(response.error,nil)
                return
            }
            switch response.result {
            case .success(let data):
                if let code = response.response?.statusCode{
                    if code == 200{
                        completion(nil, nil)

                    }else{
                        do {
                            if  let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                                debugPrint(json)
                                completion(nil, json["message"] as? String)
                            }
                           
                        } catch {
                            completion(nil, "Error in data decoding")
                        }
                    }
                }
                
            case .failure(let error):
                completion(error, nil)
            }
        }
        
    }
}
