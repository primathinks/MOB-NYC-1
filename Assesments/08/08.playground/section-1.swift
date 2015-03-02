// Assignment 8 playground

import XCPlayground
import UIKit

// Let asynchronous code run
XCPSetExecutionShouldContinueIndefinitely()


/***
*       ___
*      / _ \ _ __   ___
*     | | | | '_ \ / _ \
*     | |_| | | | |  __/
*      \___/|_| |_|\___|
*
*/
//TODO one: Write and call a function that make a successful network connection to google.com using core networking APIs, then print out the results.

if let urlOne = NSURL(string: "http://www.google.com/") {
    let taskOne = NSURLSession.sharedSession().dataTaskWithURL(urlOne, completionHandler: { (data, response, error) -> Void in
        println(response)
        var stringOfData = NSString(data: data, encoding: NSUTF8StringEncoding)
        println(stringOfData)
        
        if let writeError = error {
            println(writeError.localizedDescription)
        }
    }) //end taskOne
    taskOne.resume()
}


/***
*      _____
*     |_   _|_      _____
*       | | \ \ /\ / / _ \
*       | |  \ V  V / (_) |
*       |_|   \_/\_/ \___/
*
*/
//TODO two: Write and call a function that makes a failing network connection (using core networking APIs) to http://generalassemb.ly/foobar.baz, a nonexistant page. Print out the status code and body of the response.

if let urlTwo = NSURL(string: "http://generalassemb.ly/foobar.baz") {
    let taskTwo = NSURLSession.sharedSession().dataTaskWithURL(urlTwo, completionHandler: { (data, response, error) -> Void in
        println(response)
        
        if let writeError = error {
            println(writeError.code)
            println("Error: \(writeError.localizedDescription)")
        }
    }) //end taskTwo
    taskTwo.resume()
}


/***
*      _____ _
*     |_   _| |__  _ __ ___  ___
*       | | | '_ \| '__/ _ \/ _ \
*       | | | | | | | |  __/  __/
*       |_| |_| |_|_|  \___|\___|
*
*/
//TODO three: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON using core networking APIs. Create a model class that corresponds to the JSON response object, populate it with the contents of that JSON using NSJSONSerialization, then print out the model.
class WeatherModel {
    let city: String
    let activity: String
    let temperature: Float
    
    init(city: String, activity: String, temperature: Float) {
        self.city = city
        self.activity = activity
        self.temperature = temperature
    }
    
    func displayForecast() {
        println("Weather for \(city)")
        println("Current Activity: \(activity)")
        println("Current Temperature: \(temperature)")
    }
}

var cityThree:String
var activityThree:String
var temperatureThree:Float

if let urlThree = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=New%20York,US&units=imperial") {
    let taskThree = NSURLSession.sharedSession().dataTaskWithURL(urlThree, completionHandler: { (data, response, error) -> Void in
        var jsonError: NSError?
        if let jsonDict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: &jsonError) as? NSDictionary {
            
            // parse city
            if let cityName = jsonDict["name"] as? NSString {
                cityThree = cityName
            }
            
            // parse activity
            if let weather = jsonDict["weather"] as? NSArray {
                if let weatherDict = weather[0] as? NSDictionary {
                    if let weatherMain = weatherDict["main"] as? NSString {
                        activityThree = weatherMain
                    }
                }
            }
            
            // parse temperature
            if let main = jsonDict["main"] as? NSDictionary {
                if let temperature = main["temp"] as? Float {
                    temperatureThree = temperature
                }
            }
            
        } //end jsonDict
        
        
        if let writeError = error {
            println("Error: \(writeError.localizedDescription)")
        }
        
        let weatherThree = WeatherModel(city: cityThree, activity: activityThree, temperature: temperatureThree)
        weatherThree.displayForecast()
        
    }) //end taskThree
    taskThree.resume()
    
}


/***
*      _____
*     |  ___|__  _   _ _ __
*     | |_ / _ \| | | | '__|
*     |  _| (_) | |_| | |
*     |_|  \___/ \__,_|_|
*
*/
//TODO four: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON. Populate a your above-defined model with the contents of that JSON using SwiftyJSON, then print out the model.

// Not successful in using SwiftyJSON in Playground
// Used Cocoapods in Xcode project instead
// Open 


