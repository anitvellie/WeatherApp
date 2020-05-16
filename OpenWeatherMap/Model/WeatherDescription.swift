//
//  WeatherDescription.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 03.05.2020.
//  Copyright © 2020 Alevtina. All rights reserved.
//

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
