//
//  CurrentWeatherScene.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

import SwiftUI

struct CurrentWeatherScene {
    @ObservedObject var viewModel: CurrentWeatherViewModel
}

extension CurrentWeatherScene: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                searchByPicker
                searchField
                errorView
                if viewModel.sortedWeathers.isEmpty {
                    emptySection
                } else {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(viewModel.sortedWeathers) { weather in
                            Divider()
                            NavigationLink(
                                destination: WeeklyWeatherScene(viewModel: .init(weather: weather))
                            ) {
                                weatherCell(weather)
                                    .tappableCell()
                                    .padding(.vertical, 8)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                VStack(alignment: .leading, spacing: 0) {
                    Divider()
                    NavigationLink(
                        destination: AllRecentWeatherScene())
                    {
                        HStack {
                            Text("View all recent searches")
                                .bold()
                                .foregroundColor(.blue)
                            Spacer()
                        }
                        .tappableCell()
                    }
                    .padding(.vertical, 8)
                }
                .padding(.horizontal)
            }
            .sectionCard()
            .navigationBarTitle("Weather") // This will cause console warning in iOS 14.3
        }
        .onAppear { viewModel.onAppear() }
    }
    
    private var searchField: some View {
        HStack(alignment: .center) {
            TextField("e.g " + (viewModel.segment == .postCode
                                    ? "Sydney or Sydney,2000 or 2000"
                                    : "lat,lon(-122.08,37.39)"),
                      text: $viewModel.text)
            Image(systemName:"exclamationmark.triangle.fill").foregroundColor(viewModel.error != nil ? .red : .clear)
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        (viewModel.text.isEmpty
                            ? Color.textBorderNormal
                            : viewModel.error != nil
                            ? Color.error
                            : Color.textBorderHighlighted),
                        lineWidth: 1
                    )
        )
        .padding(.horizontal)
    }
    
    private var errorView: some View {
        Group {
            viewModel.errorText.map {
                Text($0)
                    .foregroundColor(.error)
                    .bold()
                    .padding(.horizontal)
            }
        }
    }
    
    private var emptySection: some View {
        VStack(alignment: .leading) {
            Divider()
            Text("No results")
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
    
    private func weatherCell(_ weather: CurrentWeather) -> some View {
        WeatherCell(weather: weather)
    }
    
    private var searchByPicker: some View {
        Picker("Search By:", selection: $viewModel.segment) {
            ForEach(CurrentWeatherViewModel.Segment.allCases) { Text($0.title) }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal)
    }
}

struct CurrentWeatherScene_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherScene(viewModel: CurrentWeatherViewModel())
    }
}
