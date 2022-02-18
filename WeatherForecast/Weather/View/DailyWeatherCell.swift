//
//  DailyWeatherCell.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import SwiftUI

struct DailyWeatherCell: View {
    let viewModel: DailyWeatherCellViewModel
    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading) {
                Text("\(viewModel.weather.dayString)")
                    .font(.body)
                Text("\(viewModel.weather.monthString)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .distributed(.leading)
            .frame(width: 100)
            
            Divider()
            HStack(spacing: 4) {
                AsyncImage(
                    name: viewModel.weather.weather.first?.icon ?? "",
                    placeholder: ActivityIndicatorView(isAnimating: true, style: .medium),
                    configuration: { $0.resizable().renderingMode(.original) }
                )
                    .frame(width: 30, height: 30)
                Text("\(viewModel.weather.fullDescription)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(viewModel.weather.temperatureString)
        }
    }
}

struct DailyWeatherCell_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherCell(viewModel: .init(weather: Mock.weaklyWeather.details.first!))
    }
}
