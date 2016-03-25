//
//  SearchTableViewCell.swift
//  LetsYeat
//
//  Created by Yezhisai Murugesan on 3/2/16.
//  Copyright © 2016 Isai. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var business_photo: UIImageView!
    @IBOutlet weak var rating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        business_photo.layer.cornerRadius = 45
        business_photo.layer.masksToBounds = true
        business_photo.layer.borderColor = UIColor.redColor().CGColor
        business_photo.layer.borderWidth = 2.0
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
