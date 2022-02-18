//
//  WeekluWeatherViewModel.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

import Foundation
import Combine

class WeeklyWeatherViewModel: ObservableObject {
    private var subscribers = Set<AnyCancellable>()
    let currentWeather: CurrentWeather
    @Published var dailyWeatherViewModels: [DailyWeatherCellViewModel] = []
    @Published var weeklyWeather: WeeklyWeather?
    
    let service: WeeklyWeatherServicing
    
    init(weather: CurrentWeather,
         service: WeeklyWeatherServicing = WeeklyWeatherService()) {
        self.currentWeather = weather
        self.service = service
    }
    
    var sunriseString: String? {
        weeklyWeather.map {
            DateFormatter.timeShort.string(from: $0.city.sunrise)
        }
    }
    
    var sunsetString: String? {
        weeklyWeather.map {
            DateFormatter.timeShort.string(from: $0.city.sunset)
        }
    }
}

extension WeeklyWeatherViewModel {
    func onAppear() {
        $weeklyWeather
            .map { $0?.details }
            .compactMap { $0 }
            .map {  $0.map(DailyWeatherCellViewModel.init) }
            .map { $0.removeDuplicates() }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] viewModels in
                self?.dailyWeatherViewModels = viewModels
            }
            .store(in: &subscribers)
        
        service.publisher(q: currentWeather.name)
            .receive(on: DispatchQueue.main)
            .sink { _ in } receiveValue: { [weak self] weeklyWeather in
                self?.weeklyWeather = weeklyWeather
            }
            .store(in: &subscribers)
    }
}
