//
//  Weather.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

import Foundation

struct Weather: Codable {
    let type : String
    let description : String
    let icon : String?
    
    enum CodingKeys: String, CodingKey {
        case type = "main"
        case description
        case icon
    }
}
