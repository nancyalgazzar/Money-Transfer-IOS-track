//
//  CountryViewCell.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit
import SDWebImage

class CountryViewCell: UITableViewCell {

    
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryFlag: RoundedImage!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = .clear
        // Configure the view for the selected state
    }
    func configCell(country: CountryModel){
        self.countryFlag.sd_setImage(with: URL(string: country.flags.png), placeholderImage: UIImage(named: "Country 1"))
        countryName.text = country.name.common
    }
    func configCell(country: Currency){
        self.countryFlag.sd_setImage(with: URL(string: country.flags.png), placeholderImage: UIImage(named: "Country 1"))
        countryName.text = country.currencies?.first?.value.name ?? ""
    }
}
