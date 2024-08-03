//
//  CircularView.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 02/08/2024.
//

import UIKit

@IBDesignable

class CircularView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = self.frame.height / 2.0
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}
