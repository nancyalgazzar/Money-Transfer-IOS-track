//
//  MyCardsCell.swift
//  GraduationProject
//
//  Created by 1234 on 03/08/2024.
//

import UIKit

class MyCardsCell: UITableViewCell {
    @IBOutlet weak var accountNumber: UILabel!
    
    @IBOutlet weak var accountOwner: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var imageBackView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageBackView.layer.cornerRadius = imageBackView.frame.size.width / 2
        imageBackView.clipsToBounds = true
        
       

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowOffset = CGSize(width: 1.0, height: 0.0)
        layer.shadowColor = UIColor(hex: "#00000").cgColor
        layer.cornerRadius = 10.0
       
        layer.masksToBounds = false
        layer.shadowOpacity = 0.2
        layer.shadowPath = UIBezierPath(roundedRect: contentView.bounds, cornerRadius:  contentView.layer.cornerRadius).cgPath
    }
}
