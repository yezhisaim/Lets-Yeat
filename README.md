### Lets Yeat!

## Video - https://vimeo.com/160337625

![](https://raw.githubusercontent.com/yezhisaim/Lets-Yeat/master/List-of-events.png)

![](https://raw.githubusercontent.com/yezhisaim/Lets-Yeat/master/Create-event-page.png)

![](https://raw.githubusercontent.com/yezhisaim/Lets-Yeat/master/search_results.png)

![](https://raw.githubusercontent.com/yezhisaim/Lets-Yeat/master/Confirmation-screen.png)

![](https://raw.githubusercontent.com/yezhisaim/Lets-Yeat/master/going-interested-not_going.png)

![](https://raw.githubusercontent.com/yezhisaim/Lets-Yeat/master/Profile-view.png)


## What it does

In its core, it helps foodies/yelpers/folks who yelp come together. Let's Yeat is an app to help foodies meet. User picks a restaurant(using the power of the Yelp Search API), creates an event and waits for other users to join the event. In the meantime, the user can discover other events in the area. Key features of the app:
- Look up events in the area posted by other Yelpers.
- Say you are going, interested or not interested in an event.
- Create an event.
- Look up list of good and new restaurants in the area you want to host the event at.
- Look up your recent activity in the profile view.

## How I built it

The iOS app is entirely built using Swift and the Yelp API in Xcode 7.2.1. This app works only on the simulator for Iphone 5s. Cocoapods are Oauthswift and SwiftyJSON for getting results from the Yelp API. 

## Challenges I ran into

- Did not find a way to 'login using Yelp'.
- Limited examples for ios-yelp api using Swift.
- But mostly time. Between a full-time engineering job and teaching a class, I wish I had a lot more time to implement all the features I had planned out initially. The app right now is a hack put together to show the minimum set of features and in the future, will be fully-developed to be posted on to the app store.

## Accomplishments that I'm proud of

Got out a decent working prototype in the little time I had. Still a beginner in building polished iOS apps so learnt some new concepts along the way.

## What I learned

Learn what not to do(features-wise) by getting constant feedback from real users more than what I could do. 

## What's next for Lets Yeat!

A whole bunch of enhancements:
- Implement a solid backend to save and retrieve the events that were created
- Ability for user to change the Discover events search radius for events posted in the area
- Implement autolayout to get it working on all devices/simulators other than Iphone 5S.
- Create a user-login flow
- Share the event to Facebook, twitter and other social media.
- Invite others(say someone you met at a previous event) to join a new event through the app
- Polish the UI based on user feedback
- Get an apple developer account to test on actual devices

