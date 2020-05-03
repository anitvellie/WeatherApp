//
//  Snow.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 03.05.2020.
//  Copyright © 2020 Alevtina. All rights reserved.
//

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
