//
//  Coordinate.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 03.05.2020.
//  Copyright © 2020 Alevtina. All rights reserved.
//

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
