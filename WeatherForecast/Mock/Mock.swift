//
//  Mock.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import Foundation

struct Mock {
    static let currentWeather: CurrentWeather = .init(date: Date(),
                                                      name: "Minto",
                                                      cityID: 2157508,
                                                      coordinate: Coordinate(latitute: 150.85,
                                                                             longitude: -34.0333),
                                                      weather: [.init(type: "Rain",
                                                                      description: "light rain",
                                                                      icon: "10d")],
                                                      weatherDetail: .init(temperature: 22.12,
                                                                           minTemperature: 20.56,
                                                                           maxTemperature: 23.33,
                                                                           feelsLike: 21.39 ,
                                                                           humidity: 73)
    )
    
    static let weaklyWeather: WeeklyWeather = .init(city: .init(name: "Minto",
                                                                ID: 2157508,
                                                                country: "AU",
                                                                coordinate: .init(latitute: 150.85,
                                                                                  longitude: -34.0333),
                                                                sunrise: Date(),
                                                                sunset: Date()),
                                                    details: [.init(date: Date(),
                                                                    weather: [.init(type: "Rain",
                                                                                    description: "light rain",
                                                                                    icon: "10d")],
                                                                    weatherDetail: .init(temperature: 22.12,
                                                                                         minTemperature: 20.56,
                                                                                         maxTemperature: 23.33,
                                                                                         feelsLike: 21.39 ,
                                                                                         humidity: 73))]
    )
    
}
