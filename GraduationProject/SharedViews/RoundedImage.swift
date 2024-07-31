//
//  RoundedImage.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit
class RoundedImage: UIImageView {
    
    override func  layoutSubviews() {
        super.layoutSubviews()
        let radius = self.frame.height / 2.0
        layer.cornerRadius = radius
        clipsToBounds = true
//        layer.borderColor = UIColor(hex: "#FFFFFF").cgColor
//        layer.borderWidth = 3
        
    }
}
