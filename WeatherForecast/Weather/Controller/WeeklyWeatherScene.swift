//
//  WeeklyWeatherScene.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

import SwiftUI

struct WeeklyWeatherScene: View {
    @ObservedObject var viewModel: WeeklyWeatherViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                currentWeatherDetail
                    .padding(.horizontal)
            }
            .navigationBarTitle(viewModel.currentWeather.name) // This will cause console warning in iOS 14.3
        }
        .onAppear{ viewModel.onAppear() }
    }
    
    private var currentWeatherDetail: some View {
        VStack(alignment: .leading) {
            MapView(coordinate: viewModel.currentWeather.locationCoordinate)
                .cornerRadius(25)
                .frame(height: 300)
                .disabled(true)
            
            VStack(alignment: .leading) {
                viewModel.sunriseString.map { sunrise in
                    HStack {
                        Text("Sunrise:")
                        Text(sunrise)
                            .foregroundColor(.gray)
                    }
                }
                viewModel.sunsetString.map { sunset in
                    HStack {
                        Text("Sunset:")
                        Text(sunset)
                            .foregroundColor(.gray)
                    }
                }
                HStack {
                    Text("Temperature:")
                    Text(viewModel.currentWeather.temperatureString)
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Max temperature:")
                    Text(viewModel.currentWeather.maxTemperatureString)
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Min temperature:")
                    Text(viewModel.currentWeather.minTemperatureString)
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Humidity:")
                    Text(viewModel.currentWeather.humidityString)
                        .foregroundColor(.gray)
                }
            }
            VStack(alignment: .leading) {
                ForEach(viewModel.dailyWeatherViewModels) { viewModel in
                    DailyWeatherCell(viewModel: viewModel)
                        .padding(.horizontal)
                    Divider()
                }
            }
            .sectionCard()
        }
    }
}

struct WeeklyWeatherScene_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyWeatherScene(viewModel: WeeklyWeatherViewModel(
            weather: .init(date: Date(),
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
        ))
    }
}
