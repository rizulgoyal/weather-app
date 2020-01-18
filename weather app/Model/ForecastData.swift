//
//  ForecastData.swift
//  weather app
//
//  Created by Rizul goyal on 2020-01-17.
//  Copyright © 2020 Rizul goyal. All rights reserved.
//

import Foundation

var cities: [String]?

class ForecastData
{
    internal init(city: String, data: JSON) {
        self.cityName = city
        self.dayTemp = "\(data["main"]["temp"].intValue)"
        self.minTemp = "\(data["main"]["temp_min"].intValue)"
        self.maxTemp = "\(data["main"]["temp_max"].intValue)"
        self.feelTemp = "\(data["main"]["feels_like"].intValue)"
        let date = Date(timeIntervalSince1970: data["dt"].doubleValue)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM, dd"
        let hourFormatter = DateFormatter()
        hourFormatter.dateFormat = "h:mm a"
        self.dateString = dateFormatter.string(from: date)

        self.hour = hourFormatter.string(from: date)
        self.iconcode = "\(data["weather"].arrayValue[0]["icon"].stringValue)"
    }
    
    var dateString: String
    var cityName: String
    var dayTemp: String
    var minTemp: String
    var maxTemp: String
    var feelTemp: String
    
    var hour: String
    var iconcode: String


}
