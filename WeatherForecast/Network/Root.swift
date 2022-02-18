//
//  Root.swift
//  WeatherForecast
//
//  Created by Evana Evu on 15/2/22.
//

import Foundation

class Root: ObservableObject {
    static let shared = Root()
    var environment: Request.Environment = .production
}
