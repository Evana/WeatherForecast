//
//  City.swift
//  OpenWeather
//
//  Created by Evana Islam on 15/3/21.
//

import Foundation
struct City: Codable{
    let name: String
    let ID: Int
    let country: String
    let coordinate: Coordinate
    let sunrise: Date
    let sunset: Date
    enum CodingKeys: String, CodingKey {
        case name
        case ID = "id"
        case country
        case coordinate = "coord"
        case sunrise
        case sunset
    }
}

struct Coordinate: Codable {
    let latitute: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case latitute = "lat"
        case longitude = "lon"
    }
}
