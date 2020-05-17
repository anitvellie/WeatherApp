//
//  Weather.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 09/05/2019.
//  Copyright © 2019 Alevtina. All rights reserved.
//

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
