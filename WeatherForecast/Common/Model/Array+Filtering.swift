//
//  Array+Filtering.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import Foundation

/// Taken from here: https://stackoverflow.com/a/46354989/491239
public extension Array where Element: Hashable {
    func removeDuplicates() -> [Element] {
        var seen = Set<Element>()
        return filter{ seen.insert($0).inserted }
    }
}
