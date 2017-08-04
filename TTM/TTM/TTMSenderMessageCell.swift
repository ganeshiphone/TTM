//
//  TTMSenderMessageCell.swift
//  TTM
//
//  Created by Budharaju, Ganesh on 04/08/17.
//  Copyright © 2017 Budharaju, Ganesh. All rights reserved.
//

import UIKit

class TTMSenderMessageCell: UITableViewCell {

    @IBOutlet weak var messageContainerView : UIView!
    @IBOutlet weak var messageLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageContainerView.layer.cornerRadius = 10.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
