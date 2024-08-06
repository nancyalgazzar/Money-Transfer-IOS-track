//
//  LastTransactionTableViewCell.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 02/08/2024.
//

import UIKit

class LastTransactionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var transactionImageView: UIImageView!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var cardTypeTextLabel: UILabel!
    @IBOutlet weak var lastFourNumbersTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    @IBOutlet weak var transactionTypeTextLabel: UILabel!
    @IBOutlet weak var amountTextLabel: UILabel!
    @IBOutlet weak var isSuccessfulView: RoundedCornerView!
    @IBOutlet weak var isSuccessfulTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ transaction: TransactionCellModel) {
        nameTextLabel.text = transaction.name
        cardTypeTextLabel.text = transaction.cardTypeName
        lastFourNumbersTextLabel.text = transaction.lastFourNumbers
        dateTextLabel.text = transaction.date
        transactionTypeTextLabel.text = transaction.transactionType
        amountTextLabel.text = transaction.amount
        if transaction.isSuccessful {
            isSuccessfulView.backgroundColor = #colorLiteral(red: 0.8244126846, green: 1, blue: 0.8514317188, alpha: 1)
            isSuccessfulTextLabel.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
            isSuccessfulTextLabel.text = "Successful"
        } else {
            isSuccessfulView.backgroundColor = #colorLiteral(red: 1, green: 0.937254902, blue: 0.937254902, alpha: 1)
            isSuccessfulTextLabel.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            isSuccessfulTextLabel.text = "failed"
        }
    }
}
