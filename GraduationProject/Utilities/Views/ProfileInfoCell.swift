//
//  ProfileInfoCell.swift
//  GraduationProject
//
//  Created by 1234 on 01/08/2024.
//

import UIKit

class ProfileInfoCell: UITableViewCell {

    @IBOutlet weak var fieldValueLabel: UILabel!
    @IBOutlet weak var fieldNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configCell(name: String, value: String){
        fieldValueLabel.text = value
        fieldNameLabel.text = name
    }
}
