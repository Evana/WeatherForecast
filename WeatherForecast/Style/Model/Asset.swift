//
//  Asset.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

import Foundation

struct  Asset {}

extension Asset {
    enum Color {
        case gray2B
    }
}

extension Asset.Color: Identifiable, CaseIterable {
    var id: Self { self }
}
