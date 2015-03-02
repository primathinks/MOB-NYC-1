//
//  WeatherModel.swift
//  ToDoFour
//
//  Created by Prima Prasertrat on 3/2/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import Foundation

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
