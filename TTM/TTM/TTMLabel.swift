//
//  TTMLabel.swift
//  TTM
//
//  Created by Budharaju, Ganesh on 04/08/17.
//  Copyright © 2017 Budharaju, Ganesh. All rights reserved.
//

import UIKit
let TEXT_INSET_PADDING : CGFloat = 0
class TTMLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    override func drawText(in rect: CGRect) {
        
        super.drawText(in: UIEdgeInsetsInsetRect(rect, UIEdgeInsets(top: TEXT_INSET_PADDING, left: TEXT_INSET_PADDING, bottom: TEXT_INSET_PADDING, right: TEXT_INSET_PADDING)))
    }
}
