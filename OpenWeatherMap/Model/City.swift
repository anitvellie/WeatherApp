//
//  City.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 03.05.2020.
//  Copyright © 2020 Alevtina. All rights reserved.
//

struct City: Codable, CustomStringConvertible {

    let name: String
    let country: String

    var description: String {
        return "\(name): \(country)"
    }
}

typealias CityList = [City]
