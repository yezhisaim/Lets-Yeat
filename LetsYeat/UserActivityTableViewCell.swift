//
//  UserActivityTableViewCell.swift
//  LetsYeat
//
//  Created by Yezhisai Murugesan on 3/20/16.
//  Copyright © 2016 Isai. All rights reserved.
//

import UIKit

class UserActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var user_activity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
