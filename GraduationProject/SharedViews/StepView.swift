//
//  StepView.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 02/08/2024.
//

import UIKit

class StepView: UIView {
    
    @IBInspectable var BGColor: UIColor!
    @IBInspectable var boarderColor: UIColor!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = self.frame.height / 2.0
        layer.cornerRadius = radius
        clipsToBounds = true
        self.layer.borderWidth = 3
        self.layer.borderColor = boarderColor.cgColor
        self.backgroundColor = BGColor
    }
}
