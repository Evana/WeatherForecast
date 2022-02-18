//
//  DailyWeatherCellViewModel.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import Foundation

struct DailyWeatherCellViewModel: Identifiable {
    let weather: WeeklyWeather.Detail
    
    init(weather: WeeklyWeather.Detail) {
        self.weather = weather
    }
    
    var id: String {
        return weather.dayString + weather.temperatureString + weather.title
    }
}

extension DailyWeatherCellViewModel: Hashable {
    static func == (lhs: DailyWeatherCellViewModel, rhs: DailyWeatherCellViewModel) -> Bool {
        return lhs.weather.dateString == rhs.weather.dateString
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.weather.dateString)
    }
}
