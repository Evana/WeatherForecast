//
//  WeatherCell.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import SwiftUI

struct WeatherCell: View {
    let text: Text
    let detailText: Text
    var body: some View {
        HStack {
            text
            Spacer()
            detailText
        }
    
    }
}

struct WeatherCell_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCell(text: Text("Minto"), detailText: Text("20°"))
    }
}
