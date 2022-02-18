//
//  CurrentWeather.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

import Foundation

struct CurrentWeather: Codable, Identifiable {
    let id = UUID().uuidString
    let date : Date
    let name: String
    let cityID: Int
    let coordinate: Coordinate
    let weather: [Weather]
    let weatherDetail: WeatherDetail
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case name
        case cityID = "id"
        case coordinate = "coord"
        case weather
        case weatherDetail = "main"
    }
}

