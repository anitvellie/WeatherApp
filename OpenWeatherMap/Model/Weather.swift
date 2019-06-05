//
//  Weather.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 09/05/2019.
//  Copyright © 2019 Alevtina. All rights reserved.
//

import Foundation

typealias CityList = [City]

struct City: Codable, CustomStringConvertible {
    
    let name: String
    let country: String
    
    var description: String {
        return "\(name): \(country)"
    }
}

struct Coordinate: Codable, CustomStringConvertible {
    
    var description: String {
        return "Coordinates: \(longitude) lon, \(latitude) lat\n"
    }
    
    let longitude: Float
    let latitude: Float
    
    private enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}

struct WeatherDescription: Codable, CustomStringConvertible {
    
    var description: String {
        return "Weather: \(main)\n\(fullDescription)\n"
    }
    
    let main: String
    let fullDescription: String
    let icon: String
    
    private enum CodingKeys: String, CodingKey {
        case main
        case fullDescription = "description"
        case icon
    }
}

struct MainParameter: Codable, CustomStringConvertible {
    
    var description: String {
        return "Temperature: \(temperatureKelvin) ºK, \(getTemperatureCelsius()) ºC\n"
            + "Max: \(maximumTemperatureKelvin) ºK, \(getMaxTemperatureCelsius()) ºC, min: \(minimumTemperatureKelvin) ºK, \(getMinTemperatureCelsius()) ºC\n"
            + "Pressure: \(pressure)\n" + "Humidity: \(humidity)\n"
    }
    
    let temperatureKelvin: Float
    let pressure: Float
    let humidity: Int
    let maximumTemperatureKelvin: Float
    let minimumTemperatureKelvin: Float
    
    func getTemperatureCelsius() -> Int {
        return Int((temperatureKelvin - 273.15).rounded())
    }
    
    func getMaxTemperatureCelsius() -> Int {
        return Int((maximumTemperatureKelvin - 273.15).rounded())
    }
    
    func getMinTemperatureCelsius() -> Int {
        return Int((minimumTemperatureKelvin - 273.15).rounded())
    }

    private enum CodingKeys: String, CodingKey {
        case temperatureKelvin = "temp"
        case pressure
        case humidity
        case maximumTemperatureKelvin = "temp_max"
        case minimumTemperatureKelvin = "temp_min"
    }
    
}

struct Wind: Codable, CustomStringConvertible {
    
    var description: String {
        return "Wind speed: \(speed ?? 0), degree: \(degree ?? 0)\n"
    }
    
    let speed: Float?
    let degree: Float?
    
    private enum CodingKeys: String, CodingKey {
        case speed
        case degree = "deg"
    }
    
}

struct Clouds: Codable, CustomStringConvertible {
    
    var description: String {
        return "Cloud percentage: \(percentage)\n"
    }
    
    let percentage: Float
    
    private enum CodingKeys: String, CodingKey {
        case percentage = "all"
    }
    
}

struct Rain: Codable, CustomStringConvertible {
    
    var description: String {
        return "Volume of rain in last hour: \(volumeLastHour)\n"
            + "Volume of rain in last 3 hours: \(volumeLastThreeHours)"
    }
    
    let volumeLastHour: Float
    let volumeLastThreeHours: Float
    
    private enum CodingKeys: String, CodingKey {
        case volumeLastHour = "1h"
        case volumeLastThreeHours = "3h"
    }
    
}

struct Snow: Codable, CustomStringConvertible {
    
    var description: String {
        return "Volume of snow in last hour: \(volumeLastHour)\n"
            + "Volume of snow in last 3 hours: \(volumeLastThreeHours)"
    }
    
    let volumeLastHour: Float
    let volumeLastThreeHours: Float
    
    private enum CodingKeys: String, CodingKey {
        case volumeLastHour = "1h"
        case volumeLastThreeHours = "3h"
    }
    
}

struct Weather: Codable, CustomStringConvertible {
    
    var description: String {
        var tmpDescription = "Weather in \(city):\n" + coordinate.description
        weatherDescription.forEach {
            tmpDescription.append( $0.description )
        }
        tmpDescription.append(mainParameter.description)
        tmpDescription.append("Visibility: \(visibility)\n")
        tmpDescription.append(clouds.description)
        tmpDescription.append(wind?.description ?? "")
        tmpDescription.append(rain?.description ?? "")
        tmpDescription.append(snow?.description ?? "")
        return tmpDescription
    }
    
    
    let coordinate: Coordinate
    let weatherDescription: [WeatherDescription]
    let mainParameter: MainParameter
    let visibility: Int
    let wind: Wind?
    let clouds: Clouds
    let rain: Rain?
    let snow: Snow?
    let city: String
    
    private enum CodingKeys: String, CodingKey {
        case coordinate = "coord"
        case weatherDescription = "weather"
        case mainParameter = "main"
        case visibility
        case wind
        case clouds
        case rain
        case snow
        case city = "name"
    }
    
}


