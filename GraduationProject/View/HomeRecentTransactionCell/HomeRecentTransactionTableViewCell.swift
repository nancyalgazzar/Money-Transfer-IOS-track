//
//  HomeRecentTransactionTableViewCell.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 02/08/2024.
//

import UIKit

class HomeRecentTransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var cardTypeImage: UIImageView!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var cardTypeTextLabel: UILabel!
    @IBOutlet weak var lastFourNumbersTextLabel: UILabel!
    @IBOutlet weak var dateAndTimeTextLabel: UILabel!
    @IBOutlet weak var transactionTypeTextLabel: UILabel!
    @IBOutlet weak var amountTextFilled: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ transaction: HomeRecentTransactionCellModel) {
        cardTypeImage.image = transaction.cardTypeImage
        nameTextLabel.text = transaction.name
        cardTypeTextLabel.text = transaction.cardTypeName
        lastFourNumbersTextLabel.text = transaction.lastFourNumbers
        dateAndTimeTextLabel.text = transaction.date
        transactionTypeTextLabel.text = transaction.transactionType
        amountTextFilled.text = transaction.amount
    }
    
}
