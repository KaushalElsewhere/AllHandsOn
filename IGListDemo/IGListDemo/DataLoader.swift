//
//  DataLoader.swift
//  IGListDemo
//
//  Created by Kaushal Elsewhere on 20/01/2017.
    //  Copyright © 2017 Kaushal Elsewhere. All rights reserved.
//
import UIKit

class DataLoader: NSObject {
    static func readFeedItems()  -> [FeedItem]? {
        return getFeedFromJSON("feed")
    }
    
    static func readAnychanges() -> [FeedItem]? {
        return getFeedFromJSON("changes")
    }
    
    static func getFeedFromJSON(filename: String) -> [FeedItem]? {
        if let path = NSBundle.mainBundle().pathForResource(filename, ofType: "json") {
            do {
                let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String : AnyObject]
                let response = FeedResponse(JSON: jsonData )
                return response?.data
                
            } catch let error as NSError {
                print(error.localizedDescription)
                return nil
            }
        } else {
            print("Invalid filename/path.")
            return nil
        }
    }
}