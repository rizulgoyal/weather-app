//
//  WeatheURLManager.swift
//  weather app
//
//  Created by Rizul goyal on 2020-01-17.
//  Copyright © 2020 Rizul goyal. All rights reserved.
//

import Foundation

class WeatherURLManager {
    static func getcityWeatherURL(city: String)-> URL? {
        let citynew = city.replacingOccurrences(of: " ", with: "%20")
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(citynew)&units=metric&appid=7a293fa3d1fda49318a6844883e9557f")!
                     return url
    }
    
    static func getWeatherIconURL(iconcode: String) -> URL?
    {
        let urlstring = "http://openweathermap.org/img/w/\(iconcode).png"
        return URL(string: urlstring)
    }
    
    static func getForecastWeatherURL(city: String) -> URL?
    {
        let citynew = city.replacingOccurrences(of: " ", with: "%20")

        let url = "http://api.openweathermap.org/data/2.5/forecast?q=\(citynew)&units=metric&appid=7a293fa3d1fda49318a6844883e9557f"
        return URL(string: url)
    }
}
