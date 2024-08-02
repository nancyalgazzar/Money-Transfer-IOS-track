//
//  UserDefaults+contains.swift
//  lec12
//
//  Created by 1234 on 20/07/2024.
//

import Foundation

extension UserDefaults {
    
   static func contains(_ key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
}
