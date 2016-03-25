//
//  UserAction.swift
//  LetsYeat
//
//  Created by Yezhisai Murugesan on 2/29/16.
//  Copyright © 2016 Isai. All rights reserved.
//

import Foundation

enum Actions
{
    case INTERESTED
    case GOING
    case NOT_INTERESTED
}


//Action event from a user
//Stores IDs of all users who are either interested, going or not interested in an event
class UserAction
{

    var all_ids: Dictionary<Int,Actions>! = [0: Actions.GOING]
    
    func setIds(userAction: Actions, event_id: Int)
    {
        switch(userAction)
        {
        case .INTERESTED:
            all_ids[event_id] = Actions.INTERESTED
            break
            
        case .GOING:
            all_ids[event_id] = Actions.GOING
            break
            
        case .NOT_INTERESTED:
            all_ids[event_id] = Actions.NOT_INTERESTED
            break
        }
    }
    init()
    {
    }
}

var totals: UserAction!

//Pre-load set of events
var UserActivityTimeline = [
    "You are GOING to \'Birthday\' posted by 'Anna'",
    "You are INTERESTED in \'New Years Eve\' posted by \'Cantina Mexico!\'",
    "You CREATED an event \'Let's eat Pie!\'",
    "You are GOING to \'New In Town\' posted by 'Dominique'",
    "You are NOT GOING to \'Tea time\' posted by 'Chelsea'"
    ]
    