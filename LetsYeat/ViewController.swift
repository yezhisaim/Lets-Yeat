//
//  ViewController.swift
//  LetsYeat
//
//  Created by Yezhisai Murugesan on 2/22/16.
//  Copyright © 2016 Isai. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITabBarDelegate {

    //All outlets
    @IBOutlet weak var discoverTabBarItem: UITabBarItem!
    @IBOutlet weak var createTabBarItem: UITabBarItem!
    @IBOutlet weak var profileTabBarItem: UITabBarItem!
    
    @IBOutlet weak var DiscoverContainerView: UIView!
    @IBOutlet weak var CreateContainerView: UIView!
    @IBOutlet weak var ProfileContainerView: UIView!
    @IBOutlet weak var ControlTabBar: UITabBar!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //init
        self.ControlTabBar.delegate = self
        DiscoverContainerView.hidden = false
        CreateContainerView.hidden = true
        ProfileContainerView.hidden = true
        totals = UserAction()
        
    }
    
    //------------------------------------
    //Function to toggle between tab bars
    //------------------------------------
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem)
    {
        if(item.tag == 1)
        {
            print("Discover View selected")
            DiscoverContainerView.hidden = false
            CreateContainerView.hidden = true
            ProfileContainerView.hidden = true
        }
        else if(item.tag == 2)
        {
            print("Create View selected")
            DiscoverContainerView.hidden = true
            CreateContainerView.hidden = false
            ProfileContainerView.hidden = true
        }
        else if(item.tag == 3)
        {
            print("Profile View selected")
            DiscoverContainerView.hidden = true
            CreateContainerView.hidden = true
            ProfileContainerView.hidden = false
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

