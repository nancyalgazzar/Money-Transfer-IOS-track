//
//  UserDefaultsManager.swift
//  GraduationProject
//
//  Created by 1234 on 05/08/2024.
//

import Foundation

class UserDefaultsManager {
    private static let  sharedInstance = UserDefaultsManager()
    
    static func share()-> UserDefaultsManager {
        return  UserDefaultsManager.sharedInstance
    }
    private init(){
        
    }
    let def = UserDefaults.standard
    
    var isLoggedIn: Bool? {
        set{
            def.set(newValue, forKey: "isLoggedIn")
        }
        get {
            if let _ = def.object(forKey: "isLoggedIn"){
                return def.bool(forKey: "isLoggedIn")
            }
            return nil
        }
    }
    var token :String?{
        set{
            def.set(newValue, forKey: "token")
        }
        get{
            if let _ = def.object(forKey: "token"){
                return def.string(forKey: "token")
            }
            return nil
        }
    }
}
