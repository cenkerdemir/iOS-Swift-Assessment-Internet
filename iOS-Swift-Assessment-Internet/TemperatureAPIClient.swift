//
//  TemperatureAPIClient.swift
//  iOS-Swift-Assessment-Internet
//
//  Created by Cenker Demir on 8/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class TemperatureAPIClient {

    class func getTemperaturesWithCompletion(stringURL: String, completionHandler: NSDictionary -> ()) {
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        guard let temparatureURL = NSURL(string: stringURL) else {
            print("wrong url")
            return
        }
        
        let temperatureTask = session.dataTaskWithURL(temparatureURL, completionHandler: { (data, response, error) in
            guard let data = data else {
                print("data was not not captured")
                return
            }
            do {
                let responseDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
                NSOperationQueue.mainQueue().addOperationWithBlock({
                    completionHandler(responseDictionary)
                })
            }
            catch {
                print("there was an error getting your data from the api: \(error)")
            }
        })
        temperatureTask.resume()
    }
}