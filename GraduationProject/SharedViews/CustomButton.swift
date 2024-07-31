//
//  CustomButton.swift
//  GraduationProject
//
//  Created by 1234 on 30/07/2024.
//
 
import UIKit
@IBDesignable
class CustomButton: UIButton {
    @IBInspectable var textColorCode: String = "#FFFFFF" {
        didSet{
            self.setTitleColor(UIColor(hex: textColorCode), for: .normal)
        }
    }
    @IBInspectable var radius: CGFloat = 15.0{
        didSet{
            layer.cornerRadius = radius
        }
    }
    @IBInspectable var backColor: String =  "#521220"{
        didSet{
            self.backgroundColor = UIColor(hex: backColor)

        }
    }
    @IBInspectable var borderColor: String =  "#521220"{
        didSet{
            self.layer.borderColor = UIColor(hex: backColor).cgColor

        }
    }
   
    override init(frame: CGRect){
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setTitleUnderline() {
            guard let title = self.title(for: .normal) else { return }
            
            let attributes: [NSAttributedString.Key: Any] = [
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
            
            let attributedString = NSAttributedString(string: title, attributes: attributes)
            self.setAttributedTitle(attributedString, for: .normal)
        }
  
}
