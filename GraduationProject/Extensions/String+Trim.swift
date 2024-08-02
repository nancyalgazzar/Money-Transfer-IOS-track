//
//  String+Trim.swift
//  lec12
//
//  Created by 1234 on 18/07/2024.
//

import Foundation
extension String {
    
    var trimmed: String {
        get{
            self.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
}
