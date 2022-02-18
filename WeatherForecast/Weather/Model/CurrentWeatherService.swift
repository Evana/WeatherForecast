//
//  CurrentWeatherService.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

import Foundation
import Combine


protocol CurrentWeatherFetching {
    func publisher(q: String) -> AnyPublisher<CurrentWeather, Error>
    func publisher(lat: String, lon: String) -> AnyPublisher<CurrentWeather, Error>
}

class CurrentWeatherService: CurrentWeatherFetching, APIRequestable {
    typealias ResponseType = CurrentWeather
    var httpMethod: Request.HTTPMethod = .get
    var urlEndPath: String? { "weather" }
    func publisher(q: String) -> AnyPublisher<ResponseType, Error> {
        publisher(keyValues: ["q": q])
            .eraseToAnyPublisher()
    }
    
    func publisher(lat: String, lon: String) -> AnyPublisher<ResponseType, Error> {
        publisher(keyValues: ["lat": lat, "lon": lon])
            .eraseToAnyPublisher()
    }
}
