//
//  AllRecentWeatherViewModel.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import Foundation

class AllRecentWeatherViewModel: ObservableObject {
    @Published var allWeathers: [CurrentWeather] = []
    
    init() {
        loadRecentWeathers()
    }
    
    func deleteWeather(at indexSet: IndexSet) {
        allWeathers.remove(atOffsets: indexSet)
        saveWeathers()
    }
    
    private func saveWeathers() {
        UserDefaults.standard.currentWeathers = allWeathers
    }
    
    private func loadRecentWeathers() {
        let weathers = UserDefaults.standard.currentWeathers ?? []
        allWeathers = weathers.filter { $0.date.isInToday }
            .sorted { $0.date > $1.date }
    }
}
