//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Evana Islam on 17/3/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CurrentWeatherScene(viewModel: CurrentWeatherViewModel())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
