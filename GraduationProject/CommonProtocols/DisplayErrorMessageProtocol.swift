//
//  DisplayErrorMessageProtocol.swift
//  GraduationProject
//
//  Created by 1234 on 03/08/2024.
//

import Foundation
protocol DisplayErrorMessageProtocol{
    var showError: (( String, String) -> Void)? {get set}
}
