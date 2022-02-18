//
//  WeeklyWeatherService.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

import Foundation
import Combine


protocol WeeklyWeatherServicing {
    func publisher(q: String) -> AnyPublisher<WeeklyWeather, Error>
}

class WeeklyWeatherService: WeeklyWeatherServicing, APIRequestable {
    var httpMethod: Request.HTTPMethod = .get
    typealias ResponseType = WeeklyWeather
    var urlEndPath: String? { "forecast" }
    func publisher(q: String) -> AnyPublisher<ResponseType, Error> {
        publisher(keyValues: ["q": q])
            .eraseToAnyPublisher()
    }
}
