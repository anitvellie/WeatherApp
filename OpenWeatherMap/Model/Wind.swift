//
//  Wind.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 03.05.2020.
//  Copyright © 2020 Alevtina. All rights reserved.
//

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
