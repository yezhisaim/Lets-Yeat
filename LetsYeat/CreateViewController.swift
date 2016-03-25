//
//  CreateViewController.swift
//  LetsYeat
//
//  Created by Yezhisai Murugesan on 2/24/16.
//  Copyright © 2016 Isai. All rights reserved.
//

import UIKit
import SwiftyJSON

class CreateViewController: UIViewController {

    @IBOutlet weak var event_name: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var business_name: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var user_description: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    
    //----------------------------------------
    //Store all businesses that were searched
    //----------------------------------------
    var business_array: [JSON]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Initial setup
        submitBtn.layer.cornerRadius = 10.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //----------------------------------------
    //Func to create a new event
    //Uses the Yelp search API to get results
    //----------------------------------------
    @IBAction func onPressSubmit(sender: AnyObject) {

        //Assign values
        var term: String = self.business_name.text!
        var location: String = self.location.text!
        
        //Set defaults
        if(term.characters.count == 0)
        {
            term = "Italian"
        }
        
        if(location.characters.count == 0)
        {
            location = "San Francisco, CA"
        }
        
        let parameters = ["term": term, "location": location]
        
        
        //Create event with basic details
        createNewEvent(self.event_name.text!, event_date: self.datePicker.date, poster_name: "Isai", business_name: term, business_image: "null",location: location, user_description: self.user_description.text!)
        
        //Segue to next screen with search results
        performSegueWithIdentifier("newEventSegue", sender: parameters)
    }

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "newEventSegue" {
            let nav = segue.destinationViewController as! UINavigationController
            let searchTableViewVC = nav.topViewController as! SearchViewController
            searchTableViewVC.parameters = sender as? Dictionary<String,String>!
            
        }
        
    }
    
}

