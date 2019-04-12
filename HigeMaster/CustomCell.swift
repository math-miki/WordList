//
//  CustomCell.swift
//  HigeMaster
//
//  Created by Miki Takahashi on 2019/03/30.
//  Copyright © 2019 MikiTakahashi. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet var englishLabel: UILabel!
    @IBOutlet var japaneseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
