//
//  User.swift
//  LetsYeat
//
//  Created by Yezhisai Murugesan on 2/29/16.
//  Copyright © 2016 Isai. All rights reserved.
//

import Foundation

//Counts of each user
class User
{
    var going : Set<Int>
    {
        get
        {
            return self.going
        }
        set(newVal)
        {
            self.going = newVal
        }
    }
    
    var interested : Set<Int>
    {
        get
        {
            return self.interested
        }
        set(newVal)
        {
            self.interested = newVal
        }
    }

    var not_going : Set<Int>
    {
        get
        {
            return self.not_going
        }
        set(newVal)
        {
            self.not_going = newVal
        }
    }
    
    func setIds(userAction: Actions, id: Int)
    {
        switch(userAction)
        {
            case .INTERESTED:
                             self.interested.insert(id)
                             break
            
            case .GOING:
                            self.going.insert(id)
                            break
            
            case .NOT_INTERESTED:
                            self.not_going.insert(id)
                            break
        }
    }
    
}

