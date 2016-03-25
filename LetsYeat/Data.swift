//
//  Data.swift
//  LetsYeat
//
//  Created by Yezhisai Murugesan on 2/24/16.
//  Copyright © 2016 Isai. All rights reserved.
//

import Foundation
import OAuthSwift

struct YelpAPIConsole {
    let consumerKey = "qw5xQbJuqz_5B9SnTf8Uug"
    let consumerSecret = "sbj3ovMYmOYaBf23crcTxYVpULc"
    let accessToken = "d-p0nL6AYT-z0t7d6ufmf_VCR0mc3ovb"
    let accessTokenSecret = "xLlCmKq38B9BH_47LSmXsRxfCe0"
}

class YelpAPIClient: NSObject {
    
    let APIBaseUrl = "https://api.yelp.com/v2/"
    let clientOAuth: OAuthSwiftClient?
    let apiConsoleInfo: YelpAPIConsole
    
    override init() {
        apiConsoleInfo = YelpAPIConsole()
        self.clientOAuth = OAuthSwiftClient(consumerKey: apiConsoleInfo.consumerKey, consumerSecret: apiConsoleInfo.consumerSecret, accessToken: apiConsoleInfo.accessToken, accessTokenSecret: apiConsoleInfo.accessTokenSecret)
        super.init()
    }
    
    /*
    searchPlacesWithParameters: Function that can search for places using any specified API parameter
    Arguments:
    searchParameters: Dictionary<String, String>
    successSearch: success callback with data (NSData) and response (NSHTTPURLResponse) as parameters
    failureSearch: error callback with error (NSError) as parameter
    //Refer to Yelp documentation for examples
    */
    
    func searchPlacesWithParameters(searchParameters: Dictionary<String, String>, successSearch: (data: NSData, response: NSHTTPURLResponse) -> Void, failureSearch: (error: NSError) -> Void) {
        let searchUrl = APIBaseUrl + "search/"
        clientOAuth!.get(searchUrl, parameters: searchParameters, success: successSearch, failure: failureSearch)
    }
}