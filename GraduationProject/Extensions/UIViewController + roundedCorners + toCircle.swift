//
//  UIViewController + roundedCorners.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 01/08/2024.
//

import UIKit

extension UIViewController {
    func roundedCorners(view: inout UIView, radius: Int) {
        view.layer.cornerRadius = 8
    }
    
    func toCircle(view: inout UIView) {
        view.layer.cornerRadius = view.frame.height/2
    }
}
