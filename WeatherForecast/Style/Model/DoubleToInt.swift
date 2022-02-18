//
//  DoubleToInt.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

import Foundation

extension Double {

    func toInt() -> Int? {
        let roundedValue = rounded(.toNearestOrEven)
        return Int(exactly: roundedValue)
    }

}
