//
//  DiscoverTableViewCell.swift
//  LetsYeat
//
//  Created by Yezhisai Murugesan on 3/1/16.
//  Copyright © 2016 Isai. All rights reserved.
//

import UIKit

class DiscoverTableViewCell: UITableViewCell {

    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var event_date: UILabel!
    @IBOutlet weak var business_name: UILabel!
    @IBOutlet weak var event_description: UILabel!
    @IBOutlet weak var event_num_going: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var business_image: UIImageView!
    
    @IBOutlet weak var interestedBtn: UIButton!
    @IBOutlet weak var goingBtn: UIButton!
    @IBOutlet weak var notInterestedBtn: UIButton!
    
    var event_id: Int!
    
    //Event to handle individual button presses
    
    @IBAction func onPressGoing(sender: AnyObject) {
        
        let event_name = self.username.text?.componentsSeparatedByString(" posted ")
        //Post on user activity timeline
        UserActivityTimeline.insert("You are GOING to \(event_name![1]) posted by \(event_name![0])", atIndex:0)
    
        cellContentView.backgroundColor = green_color
        
        goingBtn.enabled = false
        interestedBtn.enabled = true
        notInterestedBtn.enabled = true
        
        goingBtn.hidden  = true
        interestedBtn.hidden = false
        notInterestedBtn.hidden = false
        
        totals.setIds(.GOING, event_id: event_id)
        
        let num_going = self.event_num_going.text?.componentsSeparatedByString(" ")
        let inc = Int(num_going![0])! + 1
        self.event_num_going.text = "\(inc) going"
        
        
    }
    @IBAction func onPressInterested(sender: AnyObject) {
        
        let event_name = self.username.text?.componentsSeparatedByString(" posted ")
        //Post on user activity timeline
        UserActivityTimeline.insert("You are INTERESTED in \(event_name![1]) posted by \(event_name![0])", atIndex:0)

        cellContentView.backgroundColor = yellow_color
        goingBtn.enabled = true
        interestedBtn.enabled = false
        notInterestedBtn.enabled = true
        
        goingBtn.hidden  = false
        interestedBtn.hidden = true
        notInterestedBtn.hidden = false
        
        totals.setIds(.INTERESTED, event_id: event_id)
    }

    @IBAction func onPressNotGoing(sender: AnyObject) {
        
        let event_name = self.username.text?.componentsSeparatedByString(" posted ")
        //Post on user activity timeline
        UserActivityTimeline.insert("You are NOT GOING to \(event_name![1]) posted by \(event_name![0])", atIndex:0)
        
        cellContentView.backgroundColor = red_color
        goingBtn.enabled = true
        interestedBtn.enabled = true
        notInterestedBtn.enabled = false
        
        if(goingBtn.hidden == true)
        {
            let num_going = self.event_num_going.text?.componentsSeparatedByString(" ")
            let dec = Int(num_going![0])! - 1
            self.event_num_going.text = "\(dec) going"
        }
        
        goingBtn.hidden  = false
        interestedBtn.hidden = false
        notInterestedBtn.hidden = true
        
        totals.setIds(.NOT_INTERESTED, event_id: event_id)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        business_image.layer.cornerRadius = 45
        business_image.layer.masksToBounds = true
        business_image.layer.borderColor = UIColor.redColor().CGColor
        business_image.layer.borderWidth = 2.0
        
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }

}
