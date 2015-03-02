//
//  ViewController.swift
//  ToDoFour
//
//  Created by Prima Prasertrat on 3/2/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=Port%20Louis&units=imperial") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                var json = JSON(data: data)
                
                let cityFour = json["name"].stringValue
                let activityFour = json["weather"][0]["main"].stringValue
                let temperatureFour = json["main"]["temp"].floatValue
                
                let weatherModel = WeatherModel(city: cityFour, activity: activityFour, temperature: temperatureFour)
                
                weatherModel.displayForecast()
                
                // Required! We must update the UI only on the main queue, but this completion handler gets run in the background queue!
                dispatch_async(dispatch_get_main_queue(), {
                    //update the view
                })
                
            }) //end task
            
            // Required to start the network task
            task.resume()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

