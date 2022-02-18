//
//  CurrentWeather+ViewModel.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import Foundation
import CoreLocation

extension CurrentWeather {
    var locationCoordinate: CLLocationCoordinate2D {
      return CLLocationCoordinate2D(latitude: coordinate.latitute,
                                         longitude: coordinate.longitude)
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
    
    var humidityString: String {
        "\(weatherDetail.humidity)"
    }
}
