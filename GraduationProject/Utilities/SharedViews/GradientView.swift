//
//  GradientView.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 30/07/2024.
//

import UIKit

@IBDesignable

class GradientView: UIView {
    @IBInspectable var topColor: UIColor!
    @IBInspectable var bottomColor: UIColor!
    
    var startingPointX: CGFloat = 0
    var startingPointY: CGFloat = 0
    
    var endingPointX: CGFloat = 0
    var endingPointY: CGFloat = 1
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: startingPointX, y: startingPointY)
        gradientLayer.endPoint = CGPoint(x: endingPointX, y: endingPointY)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
