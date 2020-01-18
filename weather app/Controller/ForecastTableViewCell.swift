//
//  ForecastTableViewCell.swift
//  weather app
//
//  Created by Rizul goyal on 2020-01-17.
//  Copyright © 2020 Rizul goyal. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    @IBOutlet var labelTemp: UILabel!
    @IBOutlet var labelFeelLike: UILabel!
    
    @IBOutlet var imageWeather: UIImageView!
    @IBOutlet var labelHighTemp: UILabel!
    @IBOutlet var labelLowTemp: UILabel!
    @IBOutlet var labelTime: UILabel!
    @IBOutlet var labelDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setForecast(forecast: ForecastData)
    {
        labelDate.text = forecast.dateString
        labelTime.text = forecast.hour
        labelTemp.text = forecast.dayTemp
        labelLowTemp.text = forecast.minTemp
        labelHighTemp.text = forecast.maxTemp
        labelFeelLike.text = forecast.feelTemp
        loadimage(iconcode: forecast.iconcode)
       
    }
    
    func loadimage(iconcode: String)
    {
        let imageurl = WeatherURLManager.getWeatherIconURL(iconcode: iconcode)!
        let session = URLSession.shared
            let task = session.dataTask(with: imageurl){
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


