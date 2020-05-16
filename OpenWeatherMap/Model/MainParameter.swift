//
//  MainParameter.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 03.05.2020.
//  Copyright © 2020 Alevtina. All rights reserved.
//

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
