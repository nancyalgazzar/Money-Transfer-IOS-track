//
//  NotificationCell.swift
//  GraduationProject
//
//  Created by 1234 on 02/08/2024.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var subNotificationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var avatarLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        avatarLabel.layer.cornerRadius = avatarLabel.frame.size.height / 2
        avatarLabel.clipsToBounds = true

        // Configure the view for the selected state
    }
    
}
