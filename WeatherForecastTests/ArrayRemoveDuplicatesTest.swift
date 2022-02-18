//
//  ArrayRemoveDuplicatesTest.swift
//  WeatherForecastTests
//
//  Created by Evana Islam on 18/3/21.
//

import XCTest

@testable import WeatherForecast
class ArrayRemoveDuplicatesTest: XCTestCase {
    
    func testRemoveDuplicates() {
        let stringArray = [ "1", "1", "2", "2", nil, nil, nil, "4", "4", "4"]
            .map { string -> Int? in
                return Int(string ?? "")
            }
            .compactMap { $0 }
        let uniqueArray = stringArray.removeDuplicates()
        XCTAssertEqual(uniqueArray.count, 3)
    }
}
