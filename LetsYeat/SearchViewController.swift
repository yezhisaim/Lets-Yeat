//
//  SearchViewController.swift
//  LetsYeat
//
//  Created by Yezhisai Murugesan on 3/2/16.
//  Copyright © 2016 Isai. All rights reserved.
//

import UIKit
import SwiftyJSON
import MRProgress

//Struct to store the cell information
struct cellInfo
{
    var name: String
    var location: String
    var photo: String
    var rating: String
}


class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

//    @IBOutlet weak var resultsLbl: UILabel!
    @IBOutlet weak var resultsTableView: UITableView!
    
    //Stores the list of business' to be displayed in each cell
    var business_array = [] as [cellInfo]!
    
    //Parameters to pass to the Yelp Search API
    var parameters: Dictionary<String,String>!
    
    //Initialized Yelp Client
    let client = YelpAPIClient()
    
    //Let's use emoji's to show ratings
    let starEmoji = "⭐️"
  
    //Function to return search results
    func getSearchResults(parameters: NSDictionary)
    {
        //Declare new yelp client
        let client = YelpAPIClient()
        client.searchPlacesWithParameters(parameters as! Dictionary<String, String>, successSearch: { (data, response) -> Void in
            
            let json = JSON(data: data)
            let businesses = json["businesses"].arrayValue
            for business in businesses
            {
                print(business)
                let name = business["name"].string! as String
                var location = "" as String
                
                for line in business["location"]["display_address"].arrayValue
                {
                    location.appendContentsOf("\(line.string!) ")
                }
                
                //Assign rating
                let ratingInt = Int(business["rating"].floatValue)
                var ratingString = ""
                for _ in 1...ratingInt
                {
                    ratingString += self.starEmoji
                }
                
                //Load image
                let image = business["image_url"].string! as String
                let newImage = image.stringByReplacingOccurrencesOfString("\\", withString: "")
                self.business_array.append(cellInfo(name: name, location: location, photo: newImage, rating: ratingString))
            }
            self.resultsTableView?.reloadData()
            
            }, failureSearch: { (error) -> Void in
                print(error)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Init
        self.resultsTableView.delegate = self
        self.resultsTableView.dataSource = self
        
        //Overlay a loading block until yelp's search results are loaded
        MRProgressOverlayView.showOverlayAddedTo(self.resultsTableView, title: "Searching Yelp!", mode: MRProgressOverlayViewMode.IndeterminateSmall, animated: true)
        
        //Get the search results to be displayed
        getSearchResults(parameters)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.business_array.count
    }
    
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        //Stop the loading bar once the resutls are loaded.
        MRProgressOverlayView.dismissAllOverlaysForView(self.resultsTableView, animated: false)
        
        let cell = tableView.dequeueReusableCellWithIdentifier("searchTableViewCell", forIndexPath: indexPath) as! SearchTableViewCell
        
            cell.name?.text = self.business_array[indexPath.row].name
            cell.address?.text = self.business_array[indexPath.row].location
            let url = NSURL(string: self.business_array[indexPath.row].photo)
            let data = NSData(contentsOfURL: url!)
            cell.business_photo.image = UIImage(data: data!)
        
            cell.rating.text = self.business_array[indexPath.row].rating
        
        return cell
    }
    
    internal func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath)
    {
        
        //Sometime this method is needed
        update_current_event(self.business_array[indexPath.row].name, newAddress: self.business_array[indexPath.row].location,newImage: self.business_array[indexPath.row].photo)
    }

    
    
    internal func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        //When a row is selected
        update_current_event(self.business_array[indexPath.row].name, newAddress: self.business_array[indexPath.row].location,newImage: self.business_array[indexPath.row].photo)
    }

    
    @IBAction func onPressBack(sender: AnyObject) {
        
          performSegueWithIdentifier("mainMenuSegue", sender: self)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue == "mainMenuSegue")
        {
            let nav = segue.destinationViewController as! UINavigationController
            let createViewVC = nav.topViewController as! ViewController
            createViewVC.DiscoverContainerView.hidden = false
            createViewVC.CreateContainerView.hidden = true
            createViewVC.ProfileContainerView.hidden = true
        }
        
    }
}
