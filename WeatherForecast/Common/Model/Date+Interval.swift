//
//  Date+Interval.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import Foundation

extension Date {
    private var calendar: Calendar { .current }
    
    var isInToday: Bool {
        calendar.isDateInToday(self)
    }
}
