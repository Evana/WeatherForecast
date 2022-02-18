//
//  Color+Style.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

import SwiftUI

fileprivate extension Color {
    init(_ asset: Asset.Color) {
        self.init(String(describing: asset))
    }
}

extension Color {
    static let shadow = Color(.gray2B).opacity(0.2)
    static let disclosureIndicator = Color(.systemFill)
    static let textBorderNormal = Color.gray.opacity(0.5)
    static let textBorderHighlighted = Color.blue.opacity(0.5)
    static let error = Color.red
}
