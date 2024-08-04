//
//  ProfileCell.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var trailingIcon: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    override func awakeFromNib() {
        backgroundColor = .clear
        super.awakeFromNib()
        // Initialization code
        backView.layer.cornerRadius = 10
        trailingIcon.transform
                = trailingIcon.transform.rotated(by: .pi)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configCell(cellData: ProfileCellModel){
        iconImage.image = UIImage(named: cellData.iconImage)
        titleLabel.text = cellData.title
        subTitleLabel.text = cellData.subTitle
    }
    
}
