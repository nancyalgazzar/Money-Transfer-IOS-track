//
//  UIView+HexColor.swift
//  GraduationProject
//
//  Created by 1234 on 30/07/2024.
//

import UIKit

@IBDesignable
extension UIView {
    @IBInspectable var hexBackgroundColor: String?{
            get {
                return nil 
            }
            set {
                guard let hex = newValue else { return }
                backgroundColor = UIColor(hex: hex)
            }
        }
}
