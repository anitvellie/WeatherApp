//
//  Clouds.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 03.05.2020.
//  Copyright © 2020 Alevtina. All rights reserved.
//

struct Clouds: Codable, CustomStringConvertible {

    var description: String {
        return "Cloud percentage: \(percentage)\n"
    }

    let percentage: Float

    private enum CodingKeys: String, CodingKey {
        case percentage = "all"
    }

}
