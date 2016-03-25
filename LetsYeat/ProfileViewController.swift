//
//  ProfileViewController.swift
//  LetsYeat
//
//  Created by Yezhisai Murugesan on 2/24/16.
//  Copyright © 2016 Isai. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var UserActivityTableView: UITableView!
    var refreshControl: UIRefreshControl!

    func updateUserActivity() {
        
        self.UserActivityTableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.UserActivityTableView.delegate = self
        self.UserActivityTableView.dataSource = self
        
        //Pull to refresh
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("updateUserActivity"), forControlEvents: UIControlEvents.ValueChanged)
        self.UserActivityTableView.addSubview(refreshControl)
        self.refreshControl = refreshControl
        
        //Add blur effect
        self.UserActivityTableView.backgroundColor = UIColor.clearColor()
        let ublurEffect = UIBlurEffect(style: .Light)
        let blurEffectView = UIVisualEffectView(effect: ublurEffect)
        self.UserActivityTableView.backgroundView = blurEffectView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return UserActivityTimeline.count
    }
    
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("userActivityTableCell", forIndexPath: indexPath) as! UserActivityTableViewCell
        
        cell.user_activity.text = UserActivityTimeline[indexPath.row]
        
        return cell

    }

    
    internal func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //Animate cells on scroll
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -1000, 10, 0)
        cell.layer.transform = rotationTransform
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            cell.layer.transform = CATransform3DIdentity
        })
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
