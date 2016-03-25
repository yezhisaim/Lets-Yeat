//
//  ReviewViewController.swift
//  LetsYeat
//
//  Created by Yezhisai Murugesan on 3/2/16.
//  Copyright © 2016 Isai. All rights reserved.
//

import UIKit
import MapKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var createdTextView: UITextView!
    @IBOutlet var reviewView: UIView!
 
    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var locationView: MKMapView!
    
    //Gesture to swipe down
    let swipeDown = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let event = getCurrentEvent() as Event
        let dateString = getStringFromDate(event.event_date)
        
        if event.business_image != "null"
        {
            let url = NSURL(string: event.business_image)
            let data = NSData(contentsOfURL: url!)
            self.restaurantImage.image = UIImage(data: data!)
        
            bgImg.image = UIImage(data: data!)
        }
        self.restaurantImage.layer.cornerRadius = 50
        self.restaurantImage.layer.borderColor = UIColor.redColor().CGColor
        self.restaurantImage.layer.borderWidth = 2.0
        self.restaurantImage.layer.masksToBounds = true
        
        
        //Give a blur effect on the background
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = bgImg.bounds
        bgImg.addSubview(blurView)

        
        //Add functionality to swipe down
        swipeDown.addTarget(self, action: "swipedDown")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        reviewView.addGestureRecognizer(swipeDown)
        reviewView.userInteractionEnabled = true
        
        //Insert activity to user timeline
        UserActivityTimeline.insert("You CREATED an event \'\(event.event_name)\'", atIndex: 0)
        
        //Congratulatory message
        createdTextView.text = "You successfully created an Event '\(event.event_name)'. You will receive a notification 30 minutes prior to start of your event."
        
        //Show map of location
        var geocoder = CLGeocoder()
        geocoder.geocodeAddressString(event.address, completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            if let placemark = placemarks![0] as? CLPlacemark {
                self.locationView.addAnnotation(MKPlacemark(placemark: placemark))
                self.locationView.alpha = 0.75
                
                let span = MKCoordinateSpanMake(0.0025, 0.0025)
                let region = MKCoordinateRegion(center: (placemark.location!.coordinate), span: span)
                self.locationView.setRegion(region, animated: true)
            }
        })

        
    }
    
    func swipedDown(){
        performSegueWithIdentifier("returnToMainSegue", sender: self)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
