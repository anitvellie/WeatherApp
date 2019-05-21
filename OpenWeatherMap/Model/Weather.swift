//
//  Weather.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 09/05/2019.
//  Copyright © 2019 Alevtina. All rights reserved.
//

import Foundation

struct Coordinate: Codable, CustomStringConvertible {
    
    var description: String {
        return "Coordinates: \(longitude) lon, \(latitude) lat\n"
    }
    
    var longitude: Float
    var latitude: Float
    
    private enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}

struct WeatherDescription: Codable, CustomStringConvertible {
    
    var description: String {
        return "Weather: \(main)\n\(fullDescription)\n"
    }
    
    var main: String
    var fullDescription: String
    var icon: String
    
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
    
    var temperatureKelvin: Float
    var pressure: Float
    var humidity: Int
    var maximumTemperatureKelvin: Float
    var minimumTemperatureKelvin: Float
    
    func getTemperatureCelsius() -> Float {
        return temperatureKelvin - 273.15
    }
    
    func getMaxTemperatureCelsius() -> Float {
        return maximumTemperatureKelvin - 273.15
    }
    
    func getMinTemperatureCelsius() -> Float {
        return minimumTemperatureKelvin - 273.15
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
    
    var speed: Float?
    var degree: Float?
    
    private enum CodingKeys: String, CodingKey {
        case speed
        case degree = "deg"
    }
    
}

struct Clouds: Codable, CustomStringConvertible {
    
    var description: String {
        return "Cloud percentage: \(percentage)\n"
    }
    
    var percentage: Float
    
    private enum CodingKeys: String, CodingKey {
        case percentage = "all"
    }
    
}

struct Rain: Codable, CustomStringConvertible {
    
    var description: String {
        return "Volume of rain in last hour: \(volumeLastHour)\n"
            + "Volume of rain in last 3 hours: \(volumeLastThreeHours)"
    }
    
    var volumeLastHour: Float
    var volumeLastThreeHours: Float
    
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
    
    var volumeLastHour: Float
    var volumeLastThreeHours: Float
    
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
    
    
    var coordinate: Coordinate
    var weatherDescription: [WeatherDescription]
    var mainParameter: MainParameter
    var visibility: Int
    var wind: Wind?
    var clouds: Clouds
    var rain: Rain?
    var snow: Snow?
    var city: String
    
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


