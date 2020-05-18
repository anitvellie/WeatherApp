//
//  Counter.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 17.05.2020.
//  Copyright © 2020 Alevtina. All rights reserved.
//

import Foundation

protocol Counter {

    func sum(_ one: Int, _ two: Int) -> Int
    func sum(_ one: Double, _ two: Double) -> Double

    func divide(_ one: Int, _ two: Int) -> Int?
    func divide(_ one: Double, _ two: Double) -> Double?
}

class CounterService: Counter {

    func sum(_ one: Int, _ two: Int) -> Int {
        return one + two
    }

    func sum(_ one: Double, _ two: Double) -> Double {
        return one + two
    }

    func divide(_ one: Int, _ two: Int) -> Int? {
        guard two != .zero else { return nil }

        return one / two
    }

    func divide(_ one: Double, _ two: Double) -> Double? {
        guard two != .zero else { return nil }

        return one / two
    }
}
