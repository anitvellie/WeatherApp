//
//  OpenWeatherMapTests.swift
//  OpenWeatherMapTests
//
//  Created by Alevtina on 17.05.2020.
//  Copyright © 2020 Alevtina. All rights reserved.
//

import XCTest

@testable import OpenWeatherMap

class OpenWeatherMapTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let counter = CounterService()

        XCTAssertEqual(counter.sum(3, 4), 7)
        XCTAssertEqual(counter.sum(-3, 4), 1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
