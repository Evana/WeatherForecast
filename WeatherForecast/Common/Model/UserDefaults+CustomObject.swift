//
//  UserDefaults+CustomObject.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import Foundation

protocol DefaultKeyType: RawRepresentable {
    associatedtype DefaultsKey: RawRepresentable
}

extension UserDefaults {

    var currentWeathers: [CurrentWeather]? {
        get {
            guard let weatherData = self.object(forKey: "currentWeathers") as? Data else { return nil }
            return try? JSONDecoder().decode([CurrentWeather].self, from: weatherData)
        }
        set {
            guard let weatherArray = newValue else { return }
            if let weatherData = try? JSONEncoder().encode(weatherArray) {
                self.set(weatherData, forKey: "currentWeathers")
                self.synchronize()
            }
        }
    }

}
