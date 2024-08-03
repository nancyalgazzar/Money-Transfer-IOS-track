//
//  RoundedCornerView.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 02/08/2024.
//

import UIKit

@IBDesignable

class RoundedCornerView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = 8
        layer.cornerRadius = CGFloat(radius)
        clipsToBounds = true
    }
}
