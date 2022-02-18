//
//  WeeklyWeather.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

import Foundation

struct WeeklyWeather: Decodable {
    let city: City
    let details: [Detail]
    enum CodingKeys: String, CodingKey {
        case city
        case details = "list"
    }
}

extension WeeklyWeather {
    struct Detail: Decodable, Identifiable {
        let id = UUID().uuidString
        let date : Date
        let weather: [Weather]
        let weatherDetail: WeatherDetail
        
        enum CodingKeys: String, CodingKey {
            case date = "dt"
            case weather
            case weatherDetail = "main"
        }
    }
}
