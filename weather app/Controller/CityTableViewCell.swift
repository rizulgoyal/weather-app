//
//  CityTableViewCell.swift
//  weather app
//
//  Created by Rizul goyal on 2020-01-17.
//  Copyright © 2020 Rizul goyal. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet var imageWeather: UIImageView!
    @IBOutlet var feelslikeLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var citylabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setcity(city: String)
    {
        citylabel.text = city
        if let weatherurl = WeatherURLManager.getcityWeatherURL(city: city)
        {
            //create a session
            let session = URLSession.shared
            // create a task
            let task = session.dataTask(with: weatherurl){(data, response, error)
                in
                if data != nil
                {
                    //load the temp
                    if let weatherdata = try? JSON(data: data!)
                    {
                        
                        self.loadIcon(weatherdata: weatherdata)
                       
                        print(weatherdata)
                        let tempvalue = weatherdata["main"]["temp"].intValue
                        let feelvalue = weatherdata["main"]["feels_like"].intValue

                        DispatchQueue.main.async {
                                                        self.tempLabel.text = String(tempvalue)
                            self.feelslikeLabel.text = String(feelvalue)
                            
                            

                        }
                    

                    }
                }
                
            }
            task.resume()
        }
        
    }
    
    func loadIcon(weatherdata: JSON)
    {
        let weatherarray = weatherdata["weather"].arrayValue
        let iconCode = weatherarray[0]["icon"].stringValue
        let iconURL = WeatherURLManager.getWeatherIconURL(iconcode: iconCode)!
        let session = URLSession.shared
        let task = session.dataTask(with: iconURL){
            (data, response, error)
            in
            if let icondata = data{
                DispatchQueue.main.async {
                    self.imageWeather.image = UIImage(data: icondata)
                }
                
            }
        }
        task.resume()
    }

}
