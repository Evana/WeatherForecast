//
//  WeatherCell+ViewModel.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import SwiftUI

extension WeatherCell {
    init(weather: CurrentWeather) {
        self.init(text: Text(weather.name),
                  detailText: Text(weather.temperatureString))
    }
}
