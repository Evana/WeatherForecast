//
//  WeatherDetail.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

import Foundation

struct WeatherDetail: Codable {
    let temperature : Double
    let minTemperature : Double
    let maxTemperature : Double
    let feelsLike: Double
    let humidity : Int
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case maxTemperature = "temp_max"
        case minTemperature = "temp_min"
        case feelsLike = "feels_like"
        case humidity
    }
}
