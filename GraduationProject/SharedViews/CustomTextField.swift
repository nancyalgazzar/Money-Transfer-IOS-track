//
//  CustomTextField.swift
//  GraduationProject
//
//  Created by 1234 on 30/07/2024.
//

import UIKit
@IBDesignable
class CustomTextField: UITextField {
    @IBInspectable var rightImage: UIImage? {
        didSet {
            setupRightView()
        }
    }
    @IBInspectable var customHeight: CGFloat = 50 {
            didSet {
                invalidateIntrinsicContentSize()
            }
        }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    func setUp(){
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 7
        self.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        self.layer.shadowRadius = 50
        self.layer.borderColor = UIColor(hex: "#B0AFAE").cgColor
       
    }
    private func setupRightView() {
            guard let image = rightImage else {
                rightView = nil
                rightViewMode = .never
                return
            }
            
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        self.rightView = imageView
        self.rightViewMode = .always
        }
    
        
        override var intrinsicContentSize: CGSize {
            return CGSize(width: UIView.noIntrinsicMetric, height: customHeight)
        }
}
