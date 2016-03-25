//
//  DiscoverViewController.swift
//  LetsYeat
//
//  Created by Yezhisai Murugesan on 2/24/16.
//  Copyright © 2016 Isai. All rights reserved.
//

import UIKit

//Define colors for the cells
let green_color = UIColor(red: 181/255, green: 255/255, blue: 193/255, alpha: 1.0)
let yellow_color = UIColor(red: 255/255, green: 255/255, blue: 204/255, alpha: 1.0)
let red_color = UIColor(red: 255/255, green: 181/255, blue: 181/255, alpha: 1.0)

class DiscoverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var discoverTableView: UITableView!
    var events : [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        self.discoverTableView.delegate = self
        self.discoverTableView.dataSource = self
        //Get list of events
        events = getEvents()
        self.discoverTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("discoverTableViewCell", forIndexPath: indexPath) as! DiscoverTableViewCell
        
        //Modify cell layout
        cell.layoutMargins = UIEdgeInsetsZero;
        cell.preservesSuperviewLayoutMargins = false
        
        //Assign values
        let userPostedEvent = events[indexPath.row].poster_name + " posted \'" + events[indexPath.row].event_name + "\'"
                    
        cell.username.text = userPostedEvent
        cell.business_name.text = events[indexPath.row].business_name
        cell.address.text = events[indexPath.row].address
        cell.event_date.text = getStringFromDate(events[indexPath.row].event_date)
        cell.event_description.text = events[indexPath.row].description
        
        let url = NSURL(string: events[indexPath.row].business_image)
        let data = NSData(contentsOfURL: url!)
        cell.business_image.image = UIImage(data: data!)
        
        let event_id = events[indexPath.row].event_id
        cell.event_id = event_id
        
        let num_going = Int(arc4random_uniform(150) + 1)
        cell.event_num_going.text = "\(num_going) going"
        
        if totals != nil
        {
            if totals.all_ids != nil
            {
                if totals.all_ids[event_id] != nil
                {
                let val = totals.all_ids[event_id]! as Actions
                switch(val)
                {
                case .GOING:
                    cell.backgroundColor = green_color
                    break
                case .INTERESTED:
                    cell.backgroundColor = yellow_color
                    break
                case .NOT_INTERESTED:
                    cell.backgroundColor = red_color
                    break
                }
                }
            }
        }

        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
