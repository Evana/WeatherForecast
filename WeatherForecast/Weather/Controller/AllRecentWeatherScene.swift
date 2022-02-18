//
//  AllRecentWeatherScene.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import SwiftUI

struct AllRecentWeatherScene: View {
    @ObservedObject var viewModel = AllRecentWeatherViewModel()
    var body: some View {
        List {
            ForEach(viewModel.allWeathers) { weather in
                NavigationLink(destination: WeeklyWeatherScene(viewModel: .init(weather: weather))
                ) {
                    WeatherCell(weather: weather)
                }
            }
            .onDelete { indexSet in
                viewModel.deleteWeather(at: indexSet)
            }
        }
        .navigationBarTitle("Recent Searches")
    }
}

struct AllRecentWeatherScene_Previews: PreviewProvider {
    static var previews: some View {
        AllRecentWeatherScene()
    }
}
