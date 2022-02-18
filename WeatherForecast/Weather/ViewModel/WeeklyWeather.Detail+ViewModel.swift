//
//  WeeklyWeather+ViewModel.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import Foundation

extension WeeklyWeather.Detail {
    var dayString: String {
        DateFormatter.day.string(from: date)
    }
    
    var monthString: String {
        DateFormatter.monthDay.string(from: date)
    }
    
    var dateString: String {
        DateFormatter.dayMonthYear.string(from: date)
    }
    
    var temperatureString: String {
        "\(weatherDetail.temperature.toInt() ?? 0)°"
    }
    
    var maxTemperatureString: String {
        "\(weatherDetail.maxTemperature.toInt() ?? 0)°"
    }
    
    var minTemperatureString: String {
        "\(weatherDetail.minTemperature.toInt() ?? 0)°"
    }
    
    var title: String {
        weather.first?.type ?? ""
    }
    
    var fullDescription: String {
        weather.first?.description.capitalized ?? ""
    }
}
