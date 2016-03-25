//
//  Events.swift
//  LetsYeat
//
//  Created by Yezhisai Murugesan on 2/29/16.
//  Copyright © 2016 Isai. All rights reserved.
//

import Foundation

//Generic function to convert NSDate to a string
func getStringFromDate(date: NSDate) -> String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
    dateFormatter.timeStyle = .MediumStyle
    let date_string = dateFormatter.stringFromDate(date)
    return date_string
}

//Generic function to convert string to a NSDate
func getDateFromString(dateString: String) -> NSDate
{
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter.dateFromString(dateString)!
}

//Class event
class Event
{
    private var _event_id : Int
    var event_id : Int
    {
        get
        {
            return self._event_id
        }
        set
        {
            self._event_id = newValue
        }
    }
    
    private var _event_name : String
    var event_name : String
        {
        get
        {
            return self._event_name
        }
        set
        {
            self._event_name = newValue
        }
    }
    
    private var _event_date : NSDate
    var event_date : NSDate
    {
        get
        {
            return self._event_date
        }
        set
        {
            self._event_date = newValue
        }
    }
    
    private var _poster_name : String
    var poster_name : String
    {
        get
        {
            return self._poster_name
        }
        set
        {
            self._poster_name = newValue
        }
    }
    
    private var _business_name : String
    var business_name : String
    {
        get
        {
            return self._business_name
        }
        set
        {
            self._business_name = newValue
        }
    }
    
    var _business_image : String
    var business_image : String
    {
        get
        {
            return self._business_image
        }
        set
        {
            self._business_image = newValue
        }
    }
    
    private var _category_name : String
    var category_name : String
    {
        get
        {
            return self._category_name
        }
        set
        {
            self._category_name = newValue
        }
    }
    
    private var _description : String
    var description : String
    {
        get
        {
            return self._description
        }
        set
        {
            self._description = newValue
        }
    }
    
    private var _num_going : Int
    var num_going : Int
    {
        get
        {
            return self._num_going
        }
        set
        {
            self._num_going = newValue
        }
    }

    private var _address : String
    var address : String
    {
        get
        {
            return self._address
        }
        set
        {
            self._address = newValue
        }
    }
    
    init()
    {
        _event_id = 0
        _event_name = "Birthday"
        _event_date = NSDate()
        _address = "111 Pine Street, San Francisco, CA"
        _poster_name = "John"
        _business_name = "Burgers"
        _business_image = "null"
        _category_name = "Burgers"
        _description = "Best Burgers in Town!"
        _num_going = 10
    }

    func generateRandomEventID() -> Int
    {
        return Int(arc4random_uniform(300) + 1)
    }
}

//Store dict of event-id,event
var events = [Int:Event]()

//Store current event id
var current_event_id: Int!


//Create a new event ibject
func createNewEvent(event_name: String, event_date: NSDate, poster_name: String, business_name: String, business_image: String, location: String, user_description: String) -> Int
{
        //Declate new event
        let event = Event()
    
        event._event_name = event_name
    
        event._event_id = event.generateRandomEventID()
    
        //Set current_event_id to newly created event's id
        current_event_id = event._event_id
    
        //Poster name
        event._poster_name = poster_name
    
        //Record date
        event._event_date = event_date
        
        //Record Business
        event._business_name = business_name
    
        //Business image
        event._business_image = business_image
        
        //Record Location
        event._address = location
        
        //Record Description
        event._description = user_description
    
        events[event._event_id] = event
    
        return event._event_id
}

//Get current event id
func getCurrentEventId() -> Int
{
    return current_event_id
}

//Update current event with additional info
func update_current_event(newName: String!, newAddress: String!, newImage: String!)
{
    events[current_event_id]?._business_name = newName
    events[current_event_id]?._address = newAddress
    events[current_event_id]?._business_image = newImage
}

//Gets current event
func getCurrentEvent() -> Event
{
    return events[current_event_id]!;
}

//Gets an array of all events
func getEvents() -> [Event]
{
    var all_events: [Event] = []
    
    if(events.count == 0)
    {
        print("Loads events in all_events")
        load_events()
    }
    
    for e in events
    {
        all_events.insert(e.1, atIndex: 0)
    }
    return all_events
}


//Loads pre-existing set of events
func load_events()
{
    //Expand to load/save from/to a JSON
    let all_events : [Dictionary<String,String>] = [
        [
            "poster_name" : "Julia Campbell",
            "event_name" : "Birthday",
            "description" : "Let's celebrate my birthday!",
            "business_name" : "El Farolito",
            "event_date" : "2016-07-11 14:19:01",
            "address" : "2779 Mission St Mission San Francisco, CA 94110",
            "business_image" : "https://s3-media2.fl.yelpcdn.com/bphoto/ioIWLVqV6GATDAQwdnSr7w/ms.jpg"
        ],
        [
            "poster_name" : "Tracey Anderson",
            "event_name" : "Board games",
            "description" : "Let's eat, play and make merry!",
            "business_name" : "Pizza Pub",
            "event_date" : "2016-03-28 12:00:01",
            "address" : "1342 S Mary Ave Sunnyvale, CA 94087",
            "business_image" : "https://s3-media3.fl.yelpcdn.com/bphoto/b343FcmoT_7iOEUXSLau-g/ms.jpg"
        ],
        [
            "poster_name" : "Tony Smith",
            "business_name" : "Twenty Rows",
            "event_name" : "Italian-food lovers",
            "description" : "Try this new restaurant in town!",
            "event_date" : "2016-03-10 02:34:01",
            "address" : "880 Vallejo St Napa, CA 94559",
            "business_image" : "https://s3-media2.fl.yelpcdn.com/bphoto/0oBXppWfSD48gkXv0aa72A/ms.jpg"
        ],
        [
            "poster_name" : "Nancy Cooper",
            "event_name" : "New in town!",
            "description" : "Let's meet over a cup of coffee",
            "business_name" : "Sightglass Coffee",
            "event_date" : "2016-09-30 06:08:48",
            "address" : "270 7th St SoMa San Francisco, CA 94103",
            "business_image" : "https://s3-media3.fl.yelpcdn.com/bphoto/NIcP2dFwZ2WhbjXE96e9WA/ms.jpg"
        ],
        [
            "poster_name" : "Dennis Quaid",
            "event_name" : "Brunch buddies",
            "description" : "Folks who Brunch. We meet at a new place every sunday!",
            "business_name" : "Breakroom",
            "event_date" : "2016-11-05 09:20:01",
            "address" : "83 Baxter St Chinatown New York, NY 10013",
            "business_image" : "https://s3-media4.fl.yelpcdn.com/bphoto/erA6rW1fUVn3VTTXo7PJRA/ms.jpg"
        ],
        
    ]

    for e in all_events
    {
        createNewEvent(e["event_name"]!, event_date: getDateFromString(e["event_date"]!), poster_name: e["poster_name"]!, business_name: e["business_name"]!, business_image: e["business_image"]!, location: e["address"]!, user_description: e["description"]!)
    }
}
