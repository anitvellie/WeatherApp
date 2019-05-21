//
//  DataLoader.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 11/05/2019.
//  Copyright © 2019 Alevtina. All rights reserved.
//

import Foundation
import UIKit

protocol IDataLoader {
    
    func getWeather(for city: String, completion: @escaping ((Weather?) -> Void))
    func getIcon(for weather: Weather, completion: @escaping ((UIImage) -> Void))
}

class DataLoader: IDataLoader {
    
    private let session = URLSession.shared
    private let apiKey = "&appid=0295bb22612e4778084352c2e53a8230"
    private let urlString = "https://api.openweathermap.org/data/2.5/weather?q="
    private let iconURL = "http://openweathermap.org/img/w/"
    private let iconURLAppendix = ".png"
    
    func getWeather(for city: String, completion: @escaping ((Weather?) -> Void)) {
    
        if let url = URL(string: "\(urlString)\(city)\(apiKey)") {
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error: \(error!)")
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    print("Server error occured.")
                    return
                }
                guard let mime = response?.mimeType, mime == "application/json" else {
                    print("Wrong mime type.")
                    return
                }
                if let jsonData = data {
                    do {
                        let weather = try JSONDecoder().decode(Weather.self, from: jsonData)
                        //print(weather)
                        completion(weather)
                    } catch let error {
                        print("Error occured while JSON decoding: \(error)\n\(error.localizedDescription)")
                    }
                }
            }
            task.resume()
        }
    }
    
    func getIcon(for weather: Weather, completion: @escaping ((UIImage) -> Void)) {
        if let iconId = weather.weatherDescription.first?.icon {
            if let url = URL(string: "\(iconURL)\(iconId)\(iconURLAppendix)") {
                let task = session.dataTask(with: url) { (data, response, error) in
                    guard error == nil else {
                        print("Error: \(error!)")
                        return
                    }
                    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                        print("Server error occured.")
                        return
                    }
                    guard let data = data else {
                        print("Could not get data.")
                        return
                    }
                    guard let image = UIImage(data: data) else {
                        return
                    }
                    completion(image)
                }
                task.resume()
            }
        }
    }

    
}
