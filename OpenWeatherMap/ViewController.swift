//
//  ViewController.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 09/05/2019.
//  Copyright © 2019 Alevtina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Storyboard
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var dataLoader: DataLoader?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataLoader = DataLoader()
        dataLoader?.getWeather(for: "Cupertino") { returnWeather in
            if let weather = returnWeather {
                DispatchQueue.main.async {
                    self.cityLabel.text = weather.city
                    self.temperatureLabel.text = String(weather.mainParameter.getTemperatureCelsius())
                    self.weatherDescriptionLabel.text = weather.weatherDescription.first?.fullDescription
                }
            }
        }
    }
}
